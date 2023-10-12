require_relative '../student'
require_relative '../classroom'

describe Student do
  let(:classroom) { Classroom.new('Math Classroom') }
  let(:student) { Student.new(classroom, 26, 'Alice') }

  describe '#initialize' do
    it 'should set the age' do
      expect(student.age).to eq(26)
    end

    it 'should set the name' do
      expect(student.name).to eq('Alice')
    end

    it 'should set parent permission' do
      expect(student.parent_permission).to be(true)
    end

    it 'should set the title' do
      expect(student.title).to eq('Student')
    end
  end

  describe '#classroom=' do
    it 'should add the student to the classroom' do
      new_classroom = Classroom.new('Physics Classroom')
      student.classroom = new_classroom

      expect(new_classroom.students).to include(student)
    end
  end

  describe '#play_hooky' do
    it 'should return the play hooky message' do
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
