require 'rails_helper'

describe Library, type: :model do
  describe 'relationships' do
    it {should have_many :books}
  end

  describe 'class methods' do
    it '#sort_alphabetically' do
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

      expect(Library.sort_alphabetically).to eq([book_3, book_2, book_1])
    end
  end
end
