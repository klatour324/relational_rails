require 'rails_helper'

describe Library, type: :model do
  describe 'relationships' do
    it {should have_many :books}
  end

  describe '#books_count' do
    it 'can count the number of books associated with a library' do
      library_1 = Library.create!({
        name: 'Fredrickson Library',
        public: false,
        years_opened: 40})
      books_1 = library_1.books.create!({
        title: 'Gone Girl',
        checked_out: true,
        pages: 242})
      books_2 = library_1.books.create!({
        title: 'Pachinko',
        checked_out: false,
        pages: 301})
      library_2 = Library.create!({
        name: 'Brand New Library',
        public: false,
        years_opened: 0})

    expect(library_1.books_count).to eq 2
    expect(library_2.books_count).to eq 0
    end
  end
end
