require './decorator'

class Person < Nameable
  def initialize(age, name = 'unknown', parent_permission: true)
    super
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  attr_accessor :name, :age
  attr_reader :id

  def correct_name
    @name
  end

  def can_use_services?
    true if is_of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
