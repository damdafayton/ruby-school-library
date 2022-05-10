require './book'
require './person'
require './student'
require './teacher'
require './decorator'
require './classroom'
require './rental'
require './file_handler.rb'
require 'pry'


class App
  attr_reader :books, :people

  def initialize
    @books_file = FileHandler.new('books')
    @people_file = FileHandler.new('people')
    @rentals_file = FileHandler.new('rentals')
    @books = @books_file.read.map{ |el| Book.new(el["title"], el["author"], el["rentals"])}
    @people = @people_file.read.map { |el|
    # [{"age":"20","name":"bob","id":0,"rentals":[],"classroom":[],"class":"Student","parent_permission":true}]
      binding.pry
      if el["class"].include?('Student')
        Student.new(el["age"], el["name"], el["parent_permission"], el["classroom"])
      else
        Teacher.new(el["age"], el["name"], el["specialization"])
      end
    }
    @rentals = @rentals_file.read.map{|el|
      Rental.new(el["book"], el["person"], el["date"])
    }
  end

  def create_student(age, name, permission)
    new_person = Student.new(age, name, permission)
    @people.push(new_person)
  end

  def create_teacher(age, name, specialization)
    new_person = Teacher.new(age, name, specialization)
    @people.push(new_person)
  end

  def create_book(title, author)
    new_book = Book.new(title, author)
    @books.push(new_book)
  end

  def create_rental(book, person)
    Rental.new(book, person)
  end

  def list_books
    @books.map do |book|
      "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    @people.map do |person|
      "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_rentals_for_given_id(id)
    selected_person = @people.select { |person| person.id == id }
    selected_person[0].rentals
  end

  def exit
    @books_file.write(@books.map{|book| book.make_object})
    @people_file.write(@people.map{|person| person.make_object})
    @rentals_file.write(@rentals.map{|rental| rental.make_object})
  end
end
