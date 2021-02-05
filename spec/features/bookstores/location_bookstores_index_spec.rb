require 'rails_helper'

RSpec.describe "location_bookstores index page" do
  it "can see all associated bookstores and attributes" do
  #This test is set up to have bookstore1 added to location_1. bookstore_2
  #should be not be linked, and should confirm it is not on the page
    location_1 = Location.create({
      name: "Philadelphia",
      population: 15000000,
      urban: true})
    bookstore_1 = BookStore.create({
      name: "Harriett's Bookshop",
      inventory: 3000,
      open: true})
    bookstore_2 = BookStore.create({
      name: "Joseph Fox BookStop",
      inventory: 444,
      open: false})

    visit "/locations/#{location_1.id}/bookstores"

    expect(page).to have_content("Bookstores")
    expect(page).to have_content(bookstore_1.name)
    expect(page).to have_content(bookstore_1.inventory)
    expect(page).to have_content(bookstore_1.open)
    expect(page).to have_content(bookstore_1.created_at)
    expect(page).to have_content(bookstore_1.updated_at)
    expect(page).to have_no_content(bookstore_2.name)
  end

  it "can create a new bookstore from the location bookstores index" do
    location_1 = Location.create({
      name: "Philadelphia",
      population: 15000000,
      urban: true})
    bookstore_2 = BookStore.create({
      name: "Joseph Fox BookStop",
      inventory: 444,
      open: false})

    visit "/locations/#{location_1.id}/bookstores/new"

    expect(page).to have_content("Bookstore Name")
    expect(page).to have_content("Bookstore Inventory")
    expect(page).to have_content("Open?")

    fill_in("bs_name", with: bookstore_2.name)
    fill_in("bs_pop", with: bookstore_2.inventory)
    check('open?')

    click_on("submit")

    expect(page).to have_content("Bookstores")
    expect(page).to have_content(bookstore_2.name)
  end
end
