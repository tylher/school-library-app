require './decorators'

class Person < Nameable
  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end
  attr_accessor :name, :age, :parent_permission
  attr_reader :id, :rentals

  def correct_name
    @name
  end

  def can_use_services?
    true if of_age? || @parent_permission
  end

  def add_rental(book, date)
    @rentals.push(Rental.new(date, book, self)) unless @rentals.include?(Rental.new(date, book, self))
  end

  private

  def of_age?
    @age >= 18
  end
end
