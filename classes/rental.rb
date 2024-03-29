require 'date'

class Rental
  attr_accessor :date, :book, :person

  def initialize(book, person, date = DateTime.now)
    @date = date
    @book = book
    @person = person
    book&.add_rental(self)
    person&.add_rental(self)
  end

  def make_object
    { book_title: @book.title, person_id: @person.id, date: @date }
  end
end
