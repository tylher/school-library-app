class Rental
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
