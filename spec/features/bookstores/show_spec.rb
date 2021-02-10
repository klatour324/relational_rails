require 'rails_helper'

RSpec.describe "bookstore show page" do
  it "can display bookstore and its atttributes" do
    location_1 = Location.create! ({
      name: "Philadelphia",
      population: 15000000,
      urban: true})
    bookstore_1 = location_1.bookstores.create! ({
      name: "Harriett's Bookshop",
      inventory: 3000,
      open: true})
    bookstore_2 = location_1.bookstores.create! ({
      name: "Ace Bookshop",
      inventory: 3000,
      open: false})

    visit "/bookstores/#{bookstore_1.id}"

    expect(page).to have_content(bookstore_1.name)
    expect(page).to have_content(bookstore_1.inventory)
    expect(page).to have_content(bookstore_1.open)

    visit "/bookstores/#{bookstore_2.id}"

    expect(page).to have_content(bookstore_2.name)
    expect(page).to have_content(bookstore_2.inventory)
    expect(page).to have_content(bookstore_2.open)
  end

  it "can click the link to update a bookstore" do
    location_1 = Location.create! ({
      name: "Philadelphia",
      population: 15000000,
      urban: true})
    bookstore_1 = location_1.bookstores.create! ({
      name: "Harriett's Bookshop",
      inventory: 3000,
      open: true})

    visit "/bookstores/#{bookstore_1.id}"
    click_on("Update Bookstore")

    expect(current_path).to eq ("/bookstores/#{bookstore_1.id}/edit")
  end

  it "can delete a bookstore" do
    location_1 = Location.create! ({
      name: "Philadelphia",
      population: 15000000,
      urban: true})
    bookstore_1 = location_1.bookstores.create! ({
      name: "Harriett's Bookshop",
      inventory: 3000,
      open: true})

    visit "/bookstores/#{bookstore_1.id}"
    click_on("Delete")

    expect(page).to have_content("All Bookstores")
    expect(page).to have_no_content("Harriett's Bookshop")
  end
end
