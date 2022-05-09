class Person
  def initialize(age, name = 'Unkown', parent_permission: true)
    @id = Random.new_seed
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  attr_accessor :age, :name
  attr_reader :id

  def can_use_services?
    if is_of_age? || @parent_permission
      true
    else
      false
    end
  end

  private

  def of_age?
    @age >= 18
  end
end
