require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name, classroom = [])
    super(age, name)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_classroom(classroom)
    @classroom.push(classroom) unless @classroom.include?(classroom)
    classroom.add_student(self) unless classroom.students.include?(self)
  end
end
