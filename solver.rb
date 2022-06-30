class Solver
  def factorial(int)
    multiply = 1
    while int.positive?
      multiply *= int
      int -= 1
    end
    multiply
  end
end
