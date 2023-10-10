require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'
require_relative 'rental'
require_relative 'input.rb'

class App
  attr_accessor :books, :students, :teachers, :rental

  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts "Currently, we don't have any book in the library."
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Title: \"#{book.title}\" Author: \"#{book.author}\""
      end
    end
  end

  def list_all_persons
    if @persons.empty?
      puts "Currently, we don't have any person"
    else
      @persons.each_with_index do |person, index|
        puts "#{index + 1}) [#{person.title}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_person
    Input.person_type
  end

  def create_student
    Input.create_student(@persons)
  end

  def create_teacher
    Input.create_teacher(@persons)
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book

    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_all_books
    book_index = gets.chomp.to_i
    until book_index.between?(1, @books.length)
      print 'Invalid input. Please enter the correct number: '
      book_index = gets.chomp.to_i
    end

    puts 'Select a person from the following list by number (not id)'
    list_all_persons
    person_index = gets.chomp.to_i
    until person_index.between?(1, @persons.length)
      print 'Invalid input. Please enter the correct number: '
      person_index = gets.chomp.to_i
    end

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @persons[person_index - 1], @books[book_index - 1])
    @rentals << rental

    puts 'Rental created successfully'
  end

  def list_all_rentals_of_person
    print 'ID of person: '
    person_id = gets.chomp.to_i
    person_data = @rentals.select { |rental| rental.person.id == person_id }

    if person_data.empty?
      puts "Currently, there are no rented books in the system for the person with #{person_id} id"
    else
      puts 'Rentals: '
      person_data.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by \"#{rental.book.author}\""
      end
    end
  end

  def run
    app_intro
  end
end
