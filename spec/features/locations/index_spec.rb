require "rails_helper"

RSpec.describe "locations index page" do
  it "can see all locations names" do
    location_1 = Location.create({
      name: "Philadelphia",
      population: 15000000,
      urban: true})
    location_2 = Location.create({
      name: "New York City",
      population: 35000000,
      urban: true})

    visit "/locations"

    expect(page).to have_content(location_1.name)
    expect(page).to have_content(location_2.name)
  end

  describe "locations individual location show page" do
    it "can show all of the location's attributes" do
      location_1 = Location.create({
        name: "Philadelphia",
        population: 15000000,
        urban: true})

      visit "/locations/#{location_1.id}"

      expect(page).to have_content(location_1.name)
      expect(page).to have_content(location_1.population)
      expect(page).to have_content(location_1.urban)
    end
  end
end
