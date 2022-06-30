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
end
