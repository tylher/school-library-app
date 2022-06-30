describe Solver do
  solver = Solver.new

  it 'calls the factorial method to return the factorial of given input' do
    expect(solver.factorial(5)).to eq 120
  end
end
