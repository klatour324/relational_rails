require 'rails_helper'

RSpec.describe "bookstores index page" do
  it "can see all bookstores and their atttributes (name, open?, inventory)" do
    location_1 = Location.create! ({
      name: "Philadelphia",
      population: 15000000,
      urban: true})
    bookstore_1 = location_1.bookstores.create! ({
      name: "Harriett's Bookshop",
      inventory: 3000,
      open: true})
    bookstore_2 = location_1.bookstores.create({
      name: "Joseph Fox BookStop",
      inventory: 444,
      open: false})
    bookstore_3 = location_1.bookstores.create({
      name: "Strand Book Store",
      inventory: 600,
      open: true})

    visit "/bookstores"

    expect(page).to have_content(bookstore_1.name)
    expect(page).to have_content(bookstore_3.name)
    expect(page).to have_no_content(bookstore_2.name)
    expect(page).to have_content(bookstore_1.inventory)
    expect(page).to have_content(bookstore_1.open)
  end
end
