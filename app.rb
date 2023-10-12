require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'classroom'
require_relative 'rental'
require_relative 'input'
require_relative 'load_data'
require_relative 'preserve_data'

class App
  attr_accessor :books, :persons, :rentals

  include LoadData
  include PreserveData

  def initialize
    @persons = []
    @books = []
    @rentals = []
    load_books
    load_people
    load_rentals
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
        if person.title == 'Teacher'
          puts "#{index + 1}) [#{person.title}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age},
          Specialization: #{person.specialization}"
        else
          puts "#{index + 1}) [#{person.title}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
      end
    end
  end

  def create_person
    Input.person_type(@persons)
  end

  def create_student
    Input.create_student(@persons)
  end

  def create_teacher
    Input.create_teacher(@persons)
  end

  def create_book
    Input.create_book(@books)
  end

  def create_rental
    Input.create_rental(self)
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

  def save
    save_books
    save_people
    save_rentals
  end

  def run
    app_intro
  end
end
