require 'spec_helper'

describe Book do
  before(:all) do
    @book = Book.new('Title', 'Author')
  end
  it 'Check if object is an instance of book' do
    expect(@book).to be_instance_of Book
  end
  it '#title' do
    expect(@book.title).to eql 'Title'
  end
  it '#author' do
    expect(@book.author).to_not eql 'Hamedon'
  end
end
