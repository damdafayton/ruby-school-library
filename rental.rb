require 'date'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(book, person)
    @date = DateTime.new
    @book = book
    @person = person
  end
end
