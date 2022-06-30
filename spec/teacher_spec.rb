require 'spec_helper'
describe Teacher do
  before(:all) do
    @teacher = Teacher.new(35, 'Mathematics', 'Victor')
  end

  it 'Check if object is of class Teacher' do
    expect(@teacher).to be_instance_of Teacher
  end
  it 'confirm specialization' do
    expect(@teacher.specialization).to eq('Mathematics')
  end

  it 'capitalize name' do
    teacher_update = CapitalizeDecorator.new(@teacher)
    expect(teacher_update.correct_name).to eql('Victor')
  end
  it 'trim name if length is more than 10' do
    teacher_update_two = TrimmerDecorator.new(@teacher)
    expect(teacher_update_two.correct_name).to eql('Victor')
  end
end
