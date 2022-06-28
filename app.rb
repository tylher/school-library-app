require './student'
require './teacher'
require './book'
require './rental'

class App
  attr_accessor :books, :people, :rentals, :ids

  def initialize
    @books = []
    @people = []
    @rentals = []
    @ids = []
  end

  def entry
    puts "\nPlease select an option by entering a number"
    puts "\n\n"
    puts "1 - List all the books
    \r2 - List all the people
    \r3 - Create a person
    \r4 - Create a book
    \r5 - Create a rental
    \r6 - List all rental for a given id
    \r7 - Exit"
    puts "\n"
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
      @people << student
      @ids << student.id
      puts 'Student created successfully!'
    when 'n'
      student = Student.new('', age, name, parent_permission: false)
      @people << student
      @ids << student.id
      puts 'Student created successfully!'
    else
      print 'input not valid'
    end
  end

  def create_teacher(name, age)
    print 'what is your specialization? '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people << teacher
    @ids << teacher.id
    puts 'Teacher created successfully!'
  end

  def create_book
    print 'title: '
    title = gets.chomp
    print 'author: '
    author = gets.chomp
    if title != '' && author != ''
      book = Book.new(title, author)
      @books << book
      puts 'book created successfully'
    else
      puts 'invalid inputs'
    end
  end

  def create_rental
    print "please select the person who wants to rent (by postion on the list)\n"
    list_people
    person_no = gets.chomp.to_i
    person = @people[person_no - 1]
    print "\nplease select the book to be rented\n"
    list_books
    book_no = gets.chomp.to_i
    book = @books[book_no - 1]
    print 'date[yyyy/mm/dd]: '
    date = gets.chomp
    rental = Rental.new(date, book, person)
    @rentals << rental
    puts 'rental successfully created'
  end
end
