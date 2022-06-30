describe 'Rental class' do
  it 'returns the correct title of rented book' do
    @person = Person.new(28, 'Ade')
    @book = Book.new('LOTR', 'Tolkien')
    new_rental = Rental.new('2020', @book, @person)
    expect(@book.rentals[0].book.title).to eq('LOTR')
  end

  it 'returns correct date of rental' do
    @person = Person.new(28, 'Ade')
    @book = Book.new('LOTR', 'Tolkien')
    new_rental = Rental.new('2020', @book, @person)
    expect(@book.rentals[0].date).to eq('2020')
    expect(@person.rentals[0].date).to eq('2020')
  end
end