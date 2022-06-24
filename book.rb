class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author, rentals)
    @title = title
    @author = author
    @rentals = rentals
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
