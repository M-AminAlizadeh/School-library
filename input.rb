class Input
  def self.person_type
    loop do
      print 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
      input = gets.chomp.to_i

      case input
      when 1
        create_student
      when 2
        create_teacher
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
    student = Student.new(classroom: 'classroom', age: age, name: name, parent_permission: p_permission)
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
    teacher = Teacher.new(specialization: specialization, age: age, name: name)
    persons << teacher
    puts 'Teacher created successfully'
  end
end
