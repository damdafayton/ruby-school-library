require_relative './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, name, specialization)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def make_object
    super()
    object_data[:specialization] = @specialization
    object_data[:class] = 'Teacher'
  end
end
