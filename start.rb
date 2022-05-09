#!/usr/bin/env ruby

require './book'
require './person'
require './student'
require './decorator'
require './classroom'
require './rental'

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
capitalized_trimmed_person.correct_name

s1 = Student.new(19, 'Bob')
puts s1.age, s1.classroom

c1 = Classroom.new('Grammar')
c1.add_student(s1)
c1.students
s1.classroom

c2 = Classroom.new('Swahili')

s1.add_classroom(c2)
c2.students

book1 = Book.new('Good book', 'Nice writer')

rental1 = Rental.new(book1, s1)
puts rental1
