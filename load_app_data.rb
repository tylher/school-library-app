require 'json'

module LoadData
  def load_books
    if File.exist?('./data/books.json')
      loaded_books = JSON.parse(File.read('./data/books.json'))
      puts loaded_books
      books = []
      loaded_books.each do |book|
        books << Book.new(book['title'], book['author'])
      end
      books
    else
      puts 'file does not exist'
    end
  end
end
