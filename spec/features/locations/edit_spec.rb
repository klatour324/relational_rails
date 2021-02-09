require "rails_helper"

RSpec.describe "locations individual instance edit page" do
  it "can update a location name and population" do
    location_1 = Location.create({
      name: "Philly",
      population: 16000000,
      urban: true})

    visit "/locations/#{location_1.id}"
    click_on("Edit Location")

    expect(page).to have_content(location_1.name)
    expect(page).to have_content("Update information")

    fill_in("loc_name", with: "Philadelphia")
    fill_in("loc_pop", with: (location_1.population + 500))
    check('urban?')

    click_on("submit")

    expect(page).to have_content(location_1.name)
    expect(page).to have_content("Philadelphia")
    expect(page).to have_content(160005000)
    expect(page).to have_content(true)
  end

  it "can update a location boolean" do
    location_1 = Location.create({
      name: "Philadelphia",
      population: 16000000,
      urban: true})

    visit "/locations/#{location_1.id}/edit"
    uncheck('urban?')

    click_on("submit")
    expect(page).to have_content(false)

    visit "/locations/#{location_1.id}/edit"
    check('urban?')

    expect(page).to have_content(true)
  end
end
