require 'rails_helper'

describe Location, type: :model do
  describe 'relationships' do
    it { should have_many :bookstores }
  end

  describe 'instance methods' do
    describe '#sort_by_recently_created' do
      it 'sorts the locations by most recently created first and displays when created' do
        location_1 = Location.create({
          name: "Philadelphia",
          population: 15000000,
          urban: true})
        location_2 = Location.create({
          name: "New York City",
          population: 35000000,
          urban: true})

        expect(Location.sort_by_recently_created.first).to eq (location_1)
        expect(Location.sort_by_recently_created.last).to eq (location_2)
      end
    end
  end
end
