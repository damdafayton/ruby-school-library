class App
  def select(user_selection)
    # puts "user selected #{user_selection}"
    case user_selection
    when 1
      list_all_books()
    when 2
      list_all_people()
    when 3
      p1 = Person.new()
    when 4
      b1 = Book.new()
    when 5
      r1 = Rental.new()
    when 6
      puts "enter id"
    when 7
      puts "quit"
    else
      puts "whats that"
    end
  end
end
