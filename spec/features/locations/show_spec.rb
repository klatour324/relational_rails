require "rails_helper"

RSpec.describe "locations individual instance show page" do
  it "can show all of the location's attributes" do
    location_1 = Location.create({
      name: "Philadelphia",
      population: 15000000,
      urban: true})
    location_2 = Location.create({
      name: "Philadelphia",
      population: 15000000,
      urban: false})

    visit "/locations/#{location_1.id}"

    expect(page).to have_content(location_1.name)
    expect(page).to have_content(location_1.population)
    expect(page).to have_content(location_1.urban)
    expect(page).to have_content("Number of Bookstores:")
  end

  it "can update a location" do
    location_1 = Location.create({
      name: "Philly",
      population: 16000000,
      urban: true})

    visit "/locations/#{location_1.id}"
    click_on("Edit Location")

    expect(page).to have_content(location_1.name)
    expect(page).to have_content("Update information")

    fill_in("loc_name", with: location_1.name)
    fill_in("loc_pop", with: location_1.population)
    check('urban?')

    click_on("submit")

    expect(page).to have_content(location_1.name)
    expect(page).to have_content("Philly")
    expect(page).to have_content(16000000)
    expect(page).to have_content(true)
  end

  it "can delete a location" do
    location_1 = Location.create({
      name: "Philly",
      population: 16000000,
      urban: true})

    visit "/locations/#{location_1.id}"
    click_on("Delete")

    expect(page).to have_content("All Locations")
    expect(page).to have_no_content("Philly")
  end
end
