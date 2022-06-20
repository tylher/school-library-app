class Person
  def initialize(age, id, name = 'unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    true if is_of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
