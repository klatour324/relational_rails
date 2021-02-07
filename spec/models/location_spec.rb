require 'rails_helper'

describe Location, type: :model do
  describe 'relationships' do
    it { should have_many :songs }
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

        #expect page to display the most recet item first
      end
    end
  end 
end
