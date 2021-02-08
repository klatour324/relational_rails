require 'rails_helper'

describe Library, type: :model do
  describe 'relationships' do
    it {should have_many :books}
  end

  describe 'class methods' do
    describe '#order_by_created_date' do
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
  end
end
