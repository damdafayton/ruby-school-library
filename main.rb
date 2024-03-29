# !/usr/bin/env ruby

require './app'
require 'pry'

def ask_user(ask)
  print "#{ask}: "
  gets.chomp
end

def ask_user_i(ask)
  print "#{ask}: "
  gets.to_i
end

def ask_user?(ask)
  print "#{ask}? [Y, N]: "
  input = gets.chomp.downcase
  if input.start_with?('y')
    true
  elsif input.start_with?('n')
    false
  end
end

def person_success
  puts 'Person created successfully'
end

def create_person(app)
  person_selection = ask_user_i('Do you want to create a student (1) or a teacher (2)? Input the number')
  age = ask_user('Age')
  name = ask_user('Name')

  case person_selection
  when 1
    permission = ask_user?('Has parent permission')
    app.create_student(age, name, permission)
    person_success
  when 2
    specialization = ask_user('Specialization')
    app.create_teacher(age, name, specialization)
    person_success
  else
    puts 'Please select either 1 or 2.'
  end
end

def create_book(app)
  title = ask_user('Enter title')
  author = ask_user('Enter author')
  app.create_book(title, author)
  # binding.pry
  puts 'Book created successfully'
end

def create_rental(app)
  puts "\n Select a book from the following list by number"
  puts list_with_index(app.list_books)
  selected_book_idx = gets.to_i

  puts "\n Select a person from the following list by number (not id)"
  puts list_with_index(app.list_people)
  selected_person_idx = gets.to_i

  app.create_rental(app.books[selected_book_idx], app.people[selected_person_idx])
  puts 'Rental created successfully'
end

def list_rentals(app)
  id_to_query = ask_user_i('ID of person')
  puts 'Rentals: '
  rentals = app.list_rentals_for_given_id(id_to_query)
  rentals.each { |rental| puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" }
end

def list_with_index(arr)
  arr.map.with_index do |data, idx|
    "#{idx}) #{data}"
  end
end

def quit_app(app)
  app.exit
  puts 'Data saved'
  false
end

def options
  [
    '',
    'Please choose an option by entering a number:',
    '1 - List all books',
    '2 - List all people',
    '3 - Create a person',
    '4 - Create a book',
    '5 - Create a rental',
    '6 - List all rentals for a given person id',
    '7 - Save and exit'
  ]
end

def options_small
  [
    '',
    'Press enter to list menu',
    'Press 7 and enter to save and exit'
  ]
end

def main
  app = App.new
  puts 'Welcome to School Library App.'

  app_should_run = true
  # binding.pry
  while app_should_run
    puts options
    user_selection = gets.to_i
    case user_selection
    when 1 then puts list_with_index(app.list_books)
    when 2 then puts list_with_index(app.list_people)
    when 3 then create_person(app)
    when 4 then create_book(app)
    when 5 then create_rental(app)
    when 6 then list_rentals(app)
    when 7
      app_should_run = quit_app(app)
      break
    else puts 'Please input a number between 1 and 7'
    end

    puts options_small
    user_selection = gets.to_i
    case user_selection
    when 7 then app_should_run = quit_app(app)
    end
  end
end

main
