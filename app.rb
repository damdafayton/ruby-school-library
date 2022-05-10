require './classes/decorator'
require './classes/book'
require './classes/person'
require './classes/student'
require './classes/teacher'
require './classes/classroom'
require './classes/rental'
require './classes/file_handler'
require 'pry'

class App
  attr_reader :books, :people

  def initialize
    @books_file = FileHandler.new('books')
    @people_file = FileHandler.new('people')
    @rentals_file = FileHandler.new('rentals')
    @books = @books_file.read.map { |el| Book.new(el['title'], el['author']) }
    @people = @people_file.read.map do |el|
      # [{"age":"20","name":"bob","id":0,"rentals":[],"classroom":[],"class":"Student","parent_permission":true}]
      if el['class'].include?('Student')
        Student.new(el['age'], el['name'], el['parent_permission'], el['classroom'])
      else
        Teacher.new(el['age'], el['name'], el['specialization'])
      end
    end
    @rentals = @rentals_file.read.map do |el|
      book = @books.select { |bk| bk.title == el['book_title'] }[0]
      person = @people.select { |pn| pn.id == el['person_id'] }[0]
      # binding.pry
      Rental.new(book, person, el['date'])
    end
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
    rental = Rental.new(book, person)
    @rentals.push(rental)
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
    @books_file.write(@books.map(&:make_object))
    @people_file.write(@people.map(&:make_object))
    @rentals_file.write(@rentals.map(&:make_object))
  end
end
