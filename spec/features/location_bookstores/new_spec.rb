require 'rails_helper'

RSpec.describe "location_bookstores new page" do
  it "can fill out a form and create a new bookstore that is open" do
    location_1 = Location.create({ name: "Philadelphia", population: 15000000, urban: true})
    bookstore_1 = location_1.bookstores.create({
      name: "Harriett's Bookshop",
      inventory: 3000,
      open: true})

    visit "/locations/#{location_1.id}/bookstores/new"

    expect(page).to have_content("Bookstore Name")
    expect(page).to have_content("Bookstore Inventory")
    expect(page).to have_content("Open")

    fill_in("bs_name", with: bookstore_1.name)
    fill_in("bs_inv", with: bookstore_1.inventory)
    check('open?')

    click_on("submit")

    expect(page).to have_content("Bookstores")
    expect(page).to have_content(bookstore_1.name)
    expect(page).to have_content(bookstore_1.inventory)
    expect(page).to have_content(bookstore_1.open)
  end

  it "can fill out a form and create a new bookstore that is closed" do
    location_1 = Location.create({ name: "Philadelphia", population: 15000000, urban: true})
    bookstore_2 = location_1.bookstores.create({
      name: "Joseph Fox BookStop",
      inventory: 444,
      open: false})

    visit "/locations/#{location_1.id}/bookstores/new"

    fill_in("bs_name", with: bookstore_2.name)
    fill_in("bs_inv", with: bookstore_2.inventory)
    uncheck('open?')

    click_on("submit")

    expect(page).to have_content("Bookstores")
    expect(page).to have_content(bookstore_2.name)
    expect(page).to have_content(bookstore_2.inventory)
    expect(page).to have_content(bookstore_2.open)
  end

  it "can link to other location in the web app" do
    location_1 = Location.create! ({ name: "Philadelphia", population: 15000000, urban: true})
    bookstore_1 = location_1.bookstores.create! ({ name: "JimsBooks", inventory: 3000, open: false})

    visit "/locations/#{location_1.id}/bookstores/new"
    click_on 'Locations'

    expect(current_path).to eq("/locations")

    visit "/locations/#{location_1.id}/bookstores/new"
    click_on 'Bookstores'

    expect(current_path).to eq("/bookstores")
  end
end
