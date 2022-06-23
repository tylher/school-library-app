class Nameable
  def correct_name
    raise NotImplementedError
  end
end

class CorrectName < Nameable
  def initialize(nameable)
    @nameable = nameable
    super()
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < CorrectName
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < CorrectName
  def correct_name
    @nameable.correct_name[0, 10] if @nameable.correct_name.length > 10
  end
end
