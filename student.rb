require './person'

class Student < Person
  def initialize(classroom, id, age)
    super(id, age)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
