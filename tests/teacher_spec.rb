require_relative '../teacher'

describe Teacher do
  let(:teacher) { Teacher.new('Mathematics', 35, 'John Doe') }

  describe '#initialize' do
    it 'should set the specialization' do
      expect(teacher.specialization).to eq('Mathematics')
    end

    it 'should set the age' do
      expect(teacher.age).to eq(35)
    end

    it 'should set the name' do
      expect(teacher.name).to eq('John Doe')
    end

    it 'should set the parent permission to true' do
      expect(teacher.parent_permission).to be(true)
    end
  end

  describe '#can_use_services' do
    it 'should always return true for a teacher' do
      expect(teacher.can_use_services?).to be(true)
    end
  end
end
