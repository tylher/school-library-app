require 'json'

module LoadData
  def load_books
    books = []
    if File.exist?('./data/books.json')
      if File.empty?('./data/books.json')
        File.write('./data/books.json', [])
      else
        loaded_books = JSON.parse(File.read('./data/books.json'))
        loaded_books.each do |book|
          books << Book.new(book['title'], book['author'])
        end
      end
    else
      File.write('./data/books.json', [])
    end
    books
  end

  def load_people
    people = []
    if File.exist?('./data/people.json')
      if File.empty?('./data/people.json')
        File.write('./data/people.json', [])
      else
        loaded_people = JSON.parse(File.read('./data/people.json'))
        loaded_people.each do |person|
          case person['class']
          when 'Student'
            people << Student.new('', person['age'], person['name'], parent_permission: person['permission'])
          when 'Teacher'
            people << Teacher.new(person['age'], person['specialization'], person['name'])
          end
        end
      end
    else
      File.write('./data/people.json', [])
    end
    people
  end

  def load_rentals(books, people)
    rentals = []
    if File.exist?('./data/rentals.json')
      if File.empty?('./data/rentals.json')
        File.write('./data/rentals.json', [])
      else
        loaded_rentals = JSON.parse(File.read('./data/rentals.json'))
        loaded_rentals.each do |rental|
          rentals << Rental.new(rental['date'], books.find do |book|
            book.title == rental['book_title']
          end, people.find do |person|
            person.name == rental['name']
          end)
        end
      end
    else
      File.write('./data/rentals.json', [])
    end
    rentals
  end
end
