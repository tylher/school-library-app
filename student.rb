# frozen_string_literal: true

class Student < Person
  def initialize(classroom)
    super
    @classroom = classroom
  end

  def play_hookey
    "¯\(ツ)/¯"
  end
end
