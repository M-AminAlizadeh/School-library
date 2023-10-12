require_relative '../person'

describe Person do
  let(:person) { Person.new(10, 'Winnie', parent_permission: true) }

  describe '#initialize' do
    it 'creates a new Person instance with age, name and parent permission' do
      expect(person.name).to eq('Winnie')
      expect(person.age).to eq(10)
      expect(person.parent_permission).to be(true)
      expect(person.rentals).to be_empty
    end
  end

  describe '#can_use_services' do
    it 'checks if person can use services according to the parent permission' do
      person.age = 20
      expect(person.can_use_services?).to be(true) 
    end
  end

  describe '#correct_name' do
    it 'checks name of person' do
      person.name = 'Amin'
      expect(person.correct_name).to eq('Amin')
    end
  end

  describe '#of_age?' do
    it 'checks if person is older than 18' do
      person.age = 20
      expect(person.send(:of_age?)).to be(true)
    end

    it 'checks if person is less than 18' do
      person.age = 13
      expect(person.send(:of_age?)).to be(false)
    end
  end

  describe '#add_rental' do
    it 'creates new rental instance' do
      book = double('Book')
      date = '2023-10-10'
      expect { person.send(:add_rental, book, date) }.to change { person.rentals.length }.by(1)
    end
  end
end
