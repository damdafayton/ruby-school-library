class Person
  @id

  def initialize(age, name="Unkown", parent_permission=true)
    @age=age
    @name=name
    @parent_permission=parent_permission
  end

  def age
    @age
  end

  def name
    @name
  end

  def id
    @id
  end

  def setAge(age)
    @age=age
  end

  def setName(name)
    @name=name
  end

  def can_use_services?
    if is_of_age? || @parent_permission
      true
    else
      false
    end
  end

  private
  def is_of_age?
    if @age >= 18
      true
    else
      false
    end
  end

end

p1 = Person.new(17)

p1.age
p1.can_use_services?