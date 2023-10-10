require_relative 'app'

class AppController
  def initialize
    @app = App.new
  end

  def execute(app_controller)
    app_intro (app_controller)
  end

  def app_intro (app_controller)
    puts 'Welcome to the School Library App!'
    puts ''
    loop do
      display_options
      option = app_controller.take_input
      app_controller.option_methods(option)

      break if option == 7
    end
  end

  def take_input
    puts 'Please choose an option by enterin a number: '
    option = gets.chomp.to_i
    until option >= 1 || option <= 7
      puts 'Please enter a number between 1 and 7!'
      print 'Enter a number: '
      option = gets.chomp.to_i
    end
    option
  end

  def option_methods(option)
    case option
    when 1
      @app.list_all_books
    when 2
      @app.list_all_persons
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_all_rentals_of_person
    else
      puts 'Thank you for using this app!'
      exit
    end
  end

  # def display_options
  #   puts '1 - List all books'
  #   puts '2 - List all people'
  #   puts '3 - Create a person'
  #   puts '4 - Create a book'
  #   puts '5 - Create a rental'
  #   puts '6 - List all rentals for a given person ID'
  #   puts '7 - Exit'
  # end
end
