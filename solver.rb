class Solver
  def factorial(int)
    raise "Please enter a number which is equal or greater than zero" if int < 0

    multiply = 1
    while int.positive?
      multiply *= int
      int -= 1
    end
    multiply
  end
end