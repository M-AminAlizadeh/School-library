class Input
  def self.person_type(persons)
    loop do
      print 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
      input = gets.chomp.to_i

      case input
      when 1
        create_student(persons)
        break
      when 2
        create_teacher(persons)
        break
      else
        puts 'Invalid input. Please enter 1 for student or 2 for teacher.'
      end
    end
  end

  def self.create_student(persons)
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase
    until parent_permission.eql?('Y') || parent_permission.eql?('N')
      print 'Invalid input. Please enter the correct option [Y/N]: '
      parent_permission = gets.chomp.upcase
    end
    p_permission = parent_permission == 'Y'
    student = Student.new(Classroom.new('classroom'), age, name, parent_permission: p_permission)
    persons << student
    puts 'Student created successfully'
  end

  def self.create_teacher(persons)
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    persons << teacher
    puts 'Teacher created successfully'
  end

  def self.create_book(books)
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    books << book

    puts 'Book created successfully'
  end

  def self.create_rental(app)
    puts 'Select a book from the following list by number'
    app.list_all_books
    book_index = gets.chomp.to_i
    until book_index.between?(1, app.books.length)
      print 'Invalid input. Please enter the correct number: '
      book_index = gets.chomp.to_i
    end

    puts 'Select a person from the following list by number (not id)'
    app.list_all_persons
    person_index = gets.chomp.to_i
    until person_index.between?(1, app.persons.length)
      print 'Invalid input. Please enter the correct number: '
      person_index = gets.chomp.to_i
    end

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, app.books[book_index - 1], app.persons[person_index - 1])
    app.rentals << rental

    puts 'Rental created successfully'
  end
end
