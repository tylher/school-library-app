require 'spec_helper'

describe Book do
  before(:all) do
    @book = Book.new('Title', 'Author')
  end
  it 'Check if object is an instance of book' do
    expect(@book).to be_instance_of Book
  end
  it 'check the title attribute' do
    expect(@book.title).to eql 'Title'
  end
  it 'check the author attribute' do
    expect(@book.author).to_not eql 'Hamedon'
  end
end
