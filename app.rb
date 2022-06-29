require './student'
require './teacher'
require './book'
require './rental'

class App
  attr_accessor :books, :people, :rentals, :ids

  def initialize
    @books = []
    @people = []
    @rentals = []
    @ids = []
  end

  def entry
    puts "\nPlease select an option by entering a number"
    puts "\n\n"
    puts "1 - List all the books
    \r2 - List all the people
    \r3 - Create a person
    \r4 - Create a book
    \r5 - Create a rental
    \r6 - List all rental for a given id
    \r7 - Exit"
    puts "\n"
  end
end
