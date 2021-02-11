require "rails_helper"

RSpec.describe "locations new page" do
  it "can create a new record" do
    location_1 = Location.create({
      name: "Philadelphia",
      population: 15000000,
      urban: true})

    visit "/locations/new"

    expect(page).to have_content("Location Name")
    expect(page).to have_content("Location Population")
    expect(page).to have_content("Urban?")

    fill_in("loc_name", with: location_1.name)
    fill_in("loc_pop", with: location_1.population)
    check('urban?')

    click_on("submit")

    expect(page).to have_content("All Locations")
    expect(page).to have_content("All Locations")
  end

  it "can link to other pages on the web application" do
    location_1 = Location.create({
      name: "Philly",
      population: 16000000,
      urban: true})
    visit "/locations/#{location_1.id}/edit"
    click_on "Bookstores"

    expect(current_path).to eq("/bookstores")

    visit "/locations/#{location_1.id}/edit"
    click_on "Locations"
    
    expect(current_path).to eq("/locations")
  end
end
