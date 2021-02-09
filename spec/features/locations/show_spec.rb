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

  it "can link to a form to edit it's information" do
    location_1 = Location.create({
      name: "Philadelphia",
      population: 15000000,
      urban: true})
    visit "/locations/#{location_1.id}"

    click_on("Update Location")

    expect(current_path).to eq("/locations/#{location_1.id}/edit")
  end

  it "can delete a location" do
    location_1 = Location.create({
      name: "Philly",
      population: 16000000,
      urban: true})
    location_1.bookstores.create({name: "Joseph Fox BookStop",inventory: 444,open: false})
    location_1.bookstores.create({name: "Harriett's Bookshop",inventory: 3000,open: true})

    visit "/locations/#{location_1.id}"
    click_on("Delete Location")

    expect(page).to have_content("All Locations")
    expect(page).to have_no_content("Philly")
  end
end
