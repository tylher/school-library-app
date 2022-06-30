require 'spec_helper'

describe Person do
  before(:all) do
    @person = Person.new(28, 'Ade')
  end
  it 'Check if object is of class Person' do
    expect(@person).to be_instance_of Person
  end

  it 'check if person can use service' do
    expect(@person.can_use_services?).to eql(true)
  end

  it 'returns the correct name' do
    expect(@person.name).to eq('Ade')
  end
end
