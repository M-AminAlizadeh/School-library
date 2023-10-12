require_relative '../book'

describe Book do
  let(:book) { Book.new('Title', 'Author') }
  let(:rental) { double('Rental') }

  describe '#initialize' do
    it 'creates a new Book instance with title and author' do
      expect(book.title).to eq('Title')
      expect(book.author).to eq('Author')
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the rentals list' do
      book.add_rental(rental)
      expect(book.rentals).to include(rental)
    end
  end
end
