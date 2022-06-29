require './teacher'
require './student'
require './rental'
require 'json'

class SaveData
  def save_data(books, people, rentals)
    save_books(books)
    save_persons(people)
    save_rentals(rentals)
  end

  def save_books
    saved_books = []
    book.each do |book|
      saved_books << {
        title: book.title
        author: book.author
      }
    end
    books_data = JSON.generate(save_books)
    File.write('./data/books.json', books_data, mode: "a")
  end
end