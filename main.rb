require './app'
require './list_action'
require './create_actions'
require './save_app_data'
require 'json'

class Main
  include SaveData
  print "Welcome to the School library app \n\n"
  def initialize
    @app = App.new
  end

  def handle_ui
    loop do
      @app.entry
      option = gets.chomp.to_i
      print "\n"
      run(option)
    end
  end

  def run(option)
    case option
    when 1..2
      list_items(option)
    when 3..5
      create_items(option)
    when 6
      list_rental
    when 7
      puts 'Goodbye!!'
      save_data(@app.books, @app.people, @app.rentals)
      exit
    else
      puts 'Invalid selection, please input a valid number'
      handle_ui
    end
  end
end
Main.new.handle_ui
