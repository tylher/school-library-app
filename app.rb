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
    @books.each { |book| puts book }
  end

  def create_person
    print 'Do you want to create a student(1) or a teacher(2)? [input a number]: '
    choice = gets.chomp
    create_student if choice == '1'
  end

  def create_student
    print 'name: '
    name = $stdin.gets
    print 'age: '
    age = $stdin.gets
    print 'Does student have parent\'s permission? [Y/N]'
    ans = gets.chomp
    if ans.downcase == 'y'
      parent_permission = true
      elseif ans.downcase == 'n'
      parent_permission = false
    else
      print 'input not valid'
    end
    puts age, name, parent_permission
  end
end
