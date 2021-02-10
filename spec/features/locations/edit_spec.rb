require "rails_helper"

RSpec.describe "locations individual instance edit page" do
  describe "it can fill out the form and save the changes" do
    it "can update a location name and population" do
      location_1 = Location.create({
        name: "Philly",
        population: 16000000,
        urban: true})

      visit "/locations/#{location_1.id}/edit"

      fill_in("loc_name", with: "Philadelphia")
      fill_in("loc_pop", with: (location_1.population + 500))
      check('urban?')

      click_on("submit")

      expect(page).to have_content("Philadelphia")
      expect(page).to have_content(location_1.population + 500)
      expect(page).to have_content(true)
    end

    it "can update a location boolean beginning from true" do
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
      click_on("submit")

      expect(page).to have_content(true)
    end
  end

  it "can update a location boolean beginning from false" do
    location_2 = Location.create({
      name: "Mars",
      population: 0,
      urban: false})

    visit "/locations/#{location_2.id}/edit"
    check('urban?')
    click_on("submit")

    expect(page).to have_content(true)

    visit "/locations/#{location_2.id}/edit"
    uncheck('urban?')
    click_on("submit")

    expect(page).to have_content(false)
  end

  describe  "can link to other pages on the web application" do
    it "can link to the bookstores index" do
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
end
