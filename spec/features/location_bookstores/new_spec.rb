require 'rails_helper'

RSpec.describe "location_bookstores new page" do
  it "can fill out a form and create a new bookstore" do
    location_1 = Location.create({
      name: "Philadelphia",
      population: 15000000,
      urban: true})
    bookstore_1 = location_1.bookstores.create({
      name: "Harriett's Bookshop",
      inventory: 3000,
      open: true})
    bookstore_2 = location_1.bookstores.create({
      name: "Joseph Fox BookStop",
      inventory: 444,
      open: false})

    visit "/locations/#{location_1.id}/bookstores/new"

    expect(page).to have_content("Bookstore Name")
    expect(page).to have_content("Bookstore Inventory")
    expect(page).to have_content("Open")

    fill_in("bs_name", with: bookstore_2.name)
    fill_in("bs_inv", with: bookstore_2.inventory)
    check('open?')

    click_on("submit")

    expect(page).to have_content("Bookstores")
    expect(page).to have_content(bookstore_2.name)
  end
end
