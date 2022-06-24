require './app'
class Main
  print "Welcome to the School library app \n\n"
  def initialize
    @app = App.new
  end

  def handle_ui
    loop do
      app.entry
      option = gets.chomp
      print "\n"
      @app.run(option)
    end
  end
end
Main.new.handle_ui
