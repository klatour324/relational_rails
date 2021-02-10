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

    expect(location_3.name).to appear_before(location_2.name, only_text: true)
    expect(location_2.name).to appear_before(location_1.name, only_text: true)
  end

  it "can click the link to edit the parents info" do
    location_1 = Location.create({
      name: "Philadelphia",
      population: 15000000,
      urban: true})

    visit "/locations"
    click_link "Edit Info"

    expect(current_path).to eq("/locations/#{location_1.id}/edit")
  end

  it "can click the delete link and return to the locations index" do
    location_1 = Location.create({
      name: "Philadelphia",
      population: 15000000,
      urban: true})

    visit "/locations"
    click_link "Delete Location"

    expect(current_path).to eq("/locations/")
    expect(page).to_not have_content(location_1.name)
  end
end
