require 'rails_helper'

describe Bookstore, type: :model do
  describe 'relationships' do
    it { should belongs_to :location }
  end

  describe 'methods' do
    it '#open_to_the_public' do
      location_1 = Location.create({
        name: "Philadelphia",
        population: 1500000,
        urban: true})
      bookstore_1 = location_1.bookstores.create({
        name: "Harriett's Bookshop",
        inventory: 3000,
        open: true})
      bookstore_2 = location_1.bookstores.create({
        name: "Joseph Fox BookStop",
        inventory: 444,
        open: false})
      bookstore_3 = location_1.bookstores.create({
        name: "Strand Book Store",
        inventory: 600,
        open: true})

    expect(Bookstore.open_to_the_public).to eq([bookstore_1, bookstore_3])
    end
  end
end
