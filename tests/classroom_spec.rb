require_relative '../classroom'

describe Classroom do
  let(:classroom) { Classroom.new('Art Classroom') }
  let(:student) { Student.new(classroom, 26, 'Alice') }

  describe '#initialize' do
    it 'should set the classroom label' do
      expect(classroom.label).to eq('Art Classroom')
    end

    it 'should initialize an empty array of students' do
      expect(classroom.students).to be_an(Array)
      expect(classroom.students).to be_empty
    end
  end
end
