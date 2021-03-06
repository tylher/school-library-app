require './teacher'
require './student'
require './rental'
require 'json'

module SaveData
  def save_data(books, people, rentals)
    save_books(books)
    save_person(people)
    save_rentals(rentals)
  end

  def save_books(books)
    saved_books = []
    books.each do |book|
      saved_books << {
        title: book.title,
        author: book.author
      }
    end
    books_data = JSON.generate(saved_books)
    File.write('./data/books.json', books_data)
  end

  def save_person(people)
    saved_people = []
    people.each do |person|
      if person.instance_of? Student
        saved_people << {
          class: 'Student', id: person.id,
          name: person.name,
          age: person.age,
          permission: person.parent_permission
        }
      elsif person.instance_of? Teacher
        saved_people << {
          class: 'Teacher', id: person.id,
          name: person.name,
          age: person.age,
          specialization: person.specialization
        }
      end
    end
    File.write('./data/people.json', JSON.generate(saved_people))
  end

  def save_rentals(rentals)
    saved_rentals = []
    rentals.each do |rental|
      saved_rentals << {
        date: rental.date,
        id: rental.person.id,
        name: rental.person.name,
        book_title: rental.book.title,
        book_author: rental.book.author
      }
    end
    File.write('./data/rentals.json', JSON.generate(saved_rentals))
  end
end
