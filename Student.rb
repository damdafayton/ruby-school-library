require './Person.rb'

class Student < Person

    def initialize(classroom, age, name)
      super(age, name, nil)
      @classroom = classroom
    end

    def play_hooky
      return "¯\(ツ)/¯"
    end

end