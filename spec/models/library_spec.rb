require 'rails_helper'

describe Library, type: :model do
  describe 'relationships' do
    it {should have_many :books}
  end

  describe 'class methods' do
    describe '::order_by_created_date' do
      it 'orders and shows the records by most recently created first' do
        library_1 = Library.create!({
          name: "Chicago Public Library",
          public: true,
          years_opened:100})
        library_2 = Library.create!({
          name: "Newberry Library",
          public: false,
          years_opened: 75})

        expect(Library.order_by_created_date.first).to eq(library_2)
        expect(Library.order_by_created_date.last).to eq(library_1)
      end
    end

    describe '#books_count' do
      it 'can count the number of books associated with a library' do
        library_1 = Library.create({
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
end
