require './Person.rb'

class Teacher < Person
  def initialize(specialization, age, name)
    super(age, name, nil)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

end