require './student'
require './teacher'
require './book'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
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

  def run(option)
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rental(id)
    else
      exit
    end
  end

  def list_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author} " }
  end

  def list_people
    @people.each do |person|
      if person.is_a?(Student)
        puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age} "
      else
        puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age} "
      end
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
      @people << student
      puts 'Student created successfully!'
    when 'n'
      student = Student.new('', age, name, parent_permission: false)
      @people << student
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
end
