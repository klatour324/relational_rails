require 'rails_helper'

RSpec.describe "location_bookstores index page" do
  it "can see all associated bookstores and attributes" do
  #This test is set up to have book_store1 added to location_1. bookstore_2
  #should be not be linked, and should confirm it is not on the page
    location_1 = Location.create({
      name: "Philadelphia",
      population: 15000000,
      urban: true})
    book_store_1 = BookStore.create({
      name: "Harriett's Bookshop",
      inventory: 3000,
      open: true})
    book_store_2 = BookStore.create({
      name: "Joseph Fox BookStop",
      inventory: 444,
      open: false})

    visit "/locations/#{location_1.id}/book_stores"

    expect(page).to have_content(book_store_1.name)
    expect(page).to have_content(book_store_1.inventory)
    expect(page).to have_content(book_store_1.open)
    expect(page).to have_content(book_store_1.created_at)
    expect(page).to have_content(book_store_1.updated_at)
    expect(page).to have_no_content(book_store_2.name)
  end
end
