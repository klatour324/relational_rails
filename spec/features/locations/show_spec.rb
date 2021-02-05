require "rails_helper"

RSpec.describe "locations individual instance show page" do
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

  it "can update a location"

  it "can delete a location"
end
