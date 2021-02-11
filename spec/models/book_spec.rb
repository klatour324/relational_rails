require 'rails_helper'

describe Book, type: :model do
  describe 'relationships' do
    it { should belong_to :library }
  end

  describe 'class methods' do
    it '::is_checked_out' do
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

    it '::filter_by_pages' do
      library_1 = Library.create!({
          name: 'Logan Square Library',
          public: true,
          years_opened: 75})
      book_1 = library_1.books.create!({
          title: 'To Kill a Mockingbird',
          checked_out: true,
          pages: 445})
      book_2 = library_1.books.create!({
          title: 'Of Mice and Men',
          checked_out: false,
          pages: 187})
      book_3 = library_1.books.create!({
          title: 'A Mind for Numbers',
          checked_out: true,
          pages: 267})

      expect(Book.filter_by_pages(200)).to eq([book_1, book_3])
      expect(Book.filter_by_pages(200)).to_not eq([book_2])
    end

    it '::sort_alphabetically' do
      library_1 = Library.create!({
        name: 'Logan Square Library',
        public: true,
        years_opened: 75})
      book_1 = library_1.books.create!({
        title: 'To Kill a Mockingbird',
        checked_out: true,
        pages: 445})
      book_2 = library_1.books.create!({
        title: 'Of Mice and Men',
        checked_out: false,
        pages: 187})
      book_3 = library_1.books.create!({
        title: 'A Mind for Numbers',
        checked_out: true,
        pages: 267})

      expect(Book.sort_alphabetically).to eq([book_3, book_2, book_1])
    end
  end
end
