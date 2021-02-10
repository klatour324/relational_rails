require "rails_helper"

RSpec.describe "locations index page" do
  it "can see all locations names and time created" do
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
    expect(page).to have_content(location_2.created_at)
    expect(page).to have_content(location_2.created_at)
  end

  it "can click on a link to create a new record" do
    location_1 = Location.create({
      name: "Philadelphia",
      population: 15000000,
      urban: true})

    visit "/locations"
    click_link('New Location')
    expect(page).to have_content("Enter a new location:")
  end

  it "can order records by created date" do
    location_1 = Location.create({
      name: "Philadelphia",
      population: 15000000,
      urban: true})
    sleep(1)
    location_2 = Location.create({
      name: "New York City",
      population: 35000000,
      urban: true})
    sleep(1)
    location_3 = Location.create! ({
      name: "Chicago",
      population: 25000000,
      urban: true})

    visit "/locations"

    index_loc3 = page.body.index(location_3.created_at.to_s)
    index_loc2 = page.body.index(location_2.created_at.to_s)
    index_loc1 = page.body.index(location_1.created_at.to_s)

    expect(index_loc3).to be < (index_loc2)
    expect(index_loc2).to be < (index_loc1)
  end
end
