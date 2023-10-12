require_relative '../rental'

describe Rental do
  let(:book) { instance_double('Book', title: 'title', author: 'Author') }
  let(:person) { instance_double('Person', name: 'John Doe', rentals: []) }
  let(:date) { '2623-11-15' }

  describe '#initialize' do
    it 'should set the date' do
      rental = Rental.new(date, book, person)
      expect(rental.date).to eq(date)
    end

    it 'should set the associated book' do
      rental = Rental.new(date, book, person)
      expect(rental.book).to eq(book)
    end

    it 'should set the associated person' do
      rental = Rental.new(date, book, person)
      expect(rental.person).to eq(person)
    end
  end
end
