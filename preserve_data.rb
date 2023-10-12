require 'json'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'

module PreserveData
  def save_books
    books_list = @books.map do |book|
      {
        title: book.title,
        author: book.author
      }
    end
    save_to_file('books.json', books_list)
  end

  def save_people
    students_list = @persons.select { |person| person.is_a?(Student) }
    teachers_list = @persons.select { |person| person.is_a?(Teacher) }

    save_students(students_list)
    save_teachers(teachers_list)
  end

  def save_students(students_list)
    students_data = students_list.map do |student|
      {
        title: 'Student',
        age: student.age,
        name: student.name,
        parent_permission: student.parent_permission,
        id: student.id
      }
    end

    save_to_file('students.json', students_data)
  end

  def save_teachers(teachers_list)
    teachers_data = teachers_list.map do |teacher|
      {
        title: 'Teacher',
        specialization: teacher.specialization,
        age: teacher.age,
        name: teacher.name,
        id: teacher.id
      }
    end

    save_to_file('teachers.json', teachers_data)
  end

  def save_to_file(file_name, data)
    File.write(file_name, JSON.pretty_generate(data))
  end

  def save_rentals
    rentals_list = []
    @rentals.each do |rental|
      rental_item = {
        date: rental.date,
        book: {
          title: rental.book.title, author: rental.book.author
        },
        person: {
          id: rental.person.id, name: rental.person.name, age: rental.person.age, title: rental.person.title
        }
      }
      if rental.person.title == 'Student'
        rental_item[:person][:classroom] = rental.person.classroom.label
        rental_item[:person][:parent_permission] = rental.person.parent_permission
      else
        rental_item[:person][:specialization] = rental.person.specialization
      end
      rentals_list << rental_item
    end
    save_to_file('rentals.json', rentals_list)
  end
end
