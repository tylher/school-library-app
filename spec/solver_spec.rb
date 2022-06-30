describe 'Solver' do
  it 'calls the factorial method to return the factorial of given input' do
    integer = double(n)
    expect(integer).to receive(:factorial).with(5)

    factorial_of_input = Solver.new(integer)
    factorial_of_input.factorial(5)
  end
end
