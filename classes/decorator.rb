require_relative './nameable'

class Decorator < Nameable
  def initialize(component)
    super()
    @nameable = component
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    length = name.length
    name[0].upcase + name[1, length]
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    name[0, 8]
  end
end
