def create_items(num)
    case num
    when 3
        create_person
    when 4
        create_book
    when 5
        create_rental
    end
end


  def create_person
    print 'Do you want to create a student(1) or a teacher(2)? [input a number]: '
    choice = gets.chomp
    print 'name: '
    person_name = gets.chomp
    print 'age: '
    person_age = gets.chomp
    case choice
    when '1'
      create_student(person_name, person_age)
    else
      create_teacher(person_name, person_age)
    end
  end

  def create_student(name, age)
    print 'Does student have parent\'s permission? [Y/N] '
    ans = gets.chomp
    case ans.downcase
    when 'y'
      student = Student.new('', age, name, parent_permission: true)
      @app.people << student
      @app.ids << student.id
      puts 'Student created successfully!'
    when 'n'
      student = Student.new('', age, name, parent_permission: false)
      @app.people << student
      @app.ids << student.id
      puts 'Student created successfully!'
    else
      print 'input not valid'
    end
  end

  def create_teacher(name, age)
    print 'what is your specialization? '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @app.people << teacher
    @app.ids << teacher.id
    puts 'Teacher created successfully!'
  end

  def create_book
    print 'title: '
    title = gets.chomp
    print 'author: '
    author = gets.chomp
    if title != '' && author != ''
      book = Book.new(title, author)
      @app.books << book
      puts 'book created successfully'
    else
      puts 'invalid inputs'
    end
  end

  def create_rental
    print "please select the person who wants to rent (by postion on the list)\n"
    list_people
    person_no = gets.chomp.to_i
    person = @app.people[person_no - 1]
    print "\nplease select the book to be rented\n"
    list_books
    book_no = gets.chomp.to_i
    book = @app.books[book_no - 1]
    print 'date[yyyy/mm/dd]: '
    date = gets.chomp
    rental = Rental.new(date, book, person)
    @app.rentals << rental
    puts 'rental successfully created'
  end