require 'spec_helper'
describe Student do
  before(:all) do
    @student = Student.new('A', 23, 'ade')
  end
  it 'Check if object is of class Person' do
    expect(@student).to_not be_instance_of Person
  end
  it 'Check if object is of class Student' do
    expect(@student).to be_instance_of Student
  end
  it 'capitalize name' do
    student_update = CapitalizeDecorator.new(@student)
    expect(student_update.correct_name).to eql('Ade')
  end
  it 'confirm classroom' do
    expect(@student.classroom).to eq('A')
  end
end
