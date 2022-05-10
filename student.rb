require './person'
require 'pry'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(age, name, parent_permission, classroom = [])
    super(age, name)
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_classroom(classroom)
    @classroom.push(classroom) unless @classroom.include?(classroom)
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def make_object
    super()
    object_data = @object_data
    binding.pry
    object_data[:classroom] = @classroom
    object_data[:class] = 'Student'
    object_data[:parent_permission] = @parent_permission
    object_data
  end
end
