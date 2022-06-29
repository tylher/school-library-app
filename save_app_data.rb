require './teacher'
require './student'
require './rental'
require 'json'

class SaveData
  def save_data(books)
    save_books(books)
  end

  def save_books(books)
    saved_books = []
    books.each do |book|
      saved_books << {
        title: book.title
        author: book.author
      }
    end
    books_data = JSON.generate(saved_books)
    File.write('./data/books.json', books_data, mode: "a")
  end
end