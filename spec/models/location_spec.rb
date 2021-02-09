require 'rails_helper'

describe Location, type: :model do
  describe 'relationships' do
    it { should have_many :bookstores }
  end

  describe 'methods' do
    describe '#sort_by_recently_created' do
      it 'sorts the locations by most recently created first and displays when created' do
        location_1 = Location.create! ({
          name: "Philadelphia",
          population: 15000000,
          urban: true})
    sleep(2)
        location_2 = Location.create! ({
          name: "New York City",
          population: 35000000,
          urban: true})
    sleep(2)
        location_3 = Location.create! ({
          name: "Chicago",
          population: 25000000,
          urban: true})

        expect(Location.sort_by_recently_created[0].created_at).to be > (Location.sort_by_recently_created[1].created_at)
        expect(Location.sort_by_recently_created[1].created_at).to be > (Location.sort_by_recently_created[2].created_at)
      end
    end

    describe '#bookstore_count' do
      it 'counts the number of bookstores linked to that location' do
        location_1 = Location.create! ({
          name: "Philadelphia",
          population: 15000000,
          urban: true})
        bookstore_1 = location_1.bookstores.create! ({
          name: "Harriett's Bookshop",
          inventory: 3000,
          open: true})
        bookstore_2 = location_1.bookstores.create! ({
          name: "Books Books Books",
          inventory: 450,
          open: false})

        expect(location_1.bookstore_count).to eq 2
      end
    end

    describe '#bookstore_by_inventory' do
      it 'returns only the bookstores with greater inventory than the user input' do
        location_1 = Location.create! ({ name: "Philadelphia", population: 15000000, urban: true})
        bookstore_1 = location_1.bookstores.create! ({ name: "JimsBooks", inventory: 3000, open: false})
        bookstore_2 = location_1.bookstores.create! ({ name: "Readon", inventory: 444, open: false})

        expect(location_1.bookstores_by_inventory(500)).to eq ([bookstore_1])
      end
    end

    describe '#abc_bookstores' do
      it 'can sort the bookstores in alphabetical order by name' do
        location_1 = Location.create! ({ name: "Philadelphia", population: 15000000, urban: true})
        bookstore_1 = location_1.bookstores.create! ({ name: "JimsBooks", inventory: 3000, open: false})
        bookstore_2 = location_1.bookstores.create! ({ name: "Readon", inventory: 444, open: false})
        bookstore_3 = location_1.bookstores.create! ({ name: "Miner Books", inventory: 250, open: true})


        expect(location_1.abc_bookstores).to eq ([bookstore_1, bookstore_3, bookstore_2])
      end
    end
  end
end
