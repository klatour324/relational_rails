require 'rails_helper'

describe Book, type: :model do
  describe 'relationships' do
    it { should belong_to :library }
  end

  describe 'class methods' do
    it '#is_checked_out' do
      library_1 = Library.create!({
        name: 'Chicago Public Library',
        public: true,
        years_opened: 100})
      book_1 = library_1.books.create!({
        title: 'Of Mice an Men',
        checked_out: true,
        pages: 175})
      book_2 = library_1.books.create!({
        title: 'Onyx & Crake',
        checked_out: true,
        pages: 332})
      book_3 = library_1.books.create!({
        title: 'So You Want to Talk About Race?',
        checked_out: false,
        pages: 289})

      expect(Book.is_checked_out).to eq([book_1, book_2])
      expect(Book.is_checked_out).to_not eq([book_3])
    end
  end
end
