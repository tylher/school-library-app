def list_items(number)
  case number
  when 1
    list_books
  when 2
    list_people
  when 6
    list_rental
  end
end

def list_books
  @app.books.each { |book| puts "Title: #{book.title}, Author: #{book.author} " }
end

def list_people
  @app.people.each do |person|
    if person.is_a?(Student)
      puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age} "
    else
      puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age} "
    end
  end
end

def list_rental
  list_people
  print "\ntype an id from the options above\n"
  print 'id: '
  id = gets.chomp.to_i
  if @app.i6ds.include?(id)
    @rentals.each do |rental|
      if rental.person.id == id
        puts "date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author} "
      else
        puts '\nNo rental for this ID'
      end
    end
  else
    puts 'id not found'
  end
end
