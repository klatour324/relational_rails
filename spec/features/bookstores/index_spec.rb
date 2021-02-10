require 'rails_helper'

RSpec.describe "bookstores index page" do
  describe "display bookstores and attributes" do
    it "can see all bookstores and their atttributes (name, open?, inventory)" do
      location_1 = Location.create! ({
        name: "Philadelphia",
        population: 15000000,
        urban: true})
      bookstore_1 = location_1.bookstores.create! ({
        name: "Harriett's Bookshop",
        inventory: 3000,
        open: true})
      bookstore_3 = location_1.bookstores.create({
        name: "Strand Book Store",
        inventory: 600,
        open: true})

      visit "/bookstores"

      expect(page).to have_content(bookstore_1.name)
      expect(page).to have_content(bookstore_3.name)
      expect(page).to have_content(bookstore_1.inventory)
      expect(page).to have_content(bookstore_3.inventory)
      expect(page).to_not have_content("false")
    end

    it "can only see the bookstores that are open" do
      location_1 = Location.create! ({
        name: "Philadelphia",
        population: 15000000,
        urban: true})
      bookstore_2 = location_1.bookstores.create({
        name: "Joseph Fox BookStop",
        inventory: 444,
        open: false})
      bookstore_3 = location_1.bookstores.create({
        name: "Strand Book Store",
        inventory: 600,
        open: true})
      bookstore_4 = location_1.bookstores.create({
        name: "This is Not for the Public",
        inventory: 1000000,
        open: false})
      visit "/bookstores"

      expect(page).to have_content(bookstore_3.name)
      expect(page).to have_content(bookstore_3.inventory)
      expect(page).to have_content(bookstore_3.open)
      expect(page).to_not have_content(bookstore_2.name)
      expect(page).to_not have_content(bookstore_4.name)
    end
  end

  describe "hyperlinks to other pages within web application" do
    it "can link to locations" do
      visit "/bookstores"
      click_on "Locations"

      expect(current_path).to eq("/locations")
    end

    it "can click on the link and update the bookstore" do
      location_1 = Location.create! ({
        name: "Philadelphia",
        population: 15000000,
        urban: true})
      bookstore_1 = location_1.bookstores.create! ({
        name: "Harriett's Bookshop",
        inventory: 3000,
        open: true})
      bookstore_3 = location_1.bookstores.create({
        name: "Strand Book Store",
        inventory: 600,
        open: true})

      visit "/bookstores"
      first(:link, "Update Bookstore").click

      expect(current_path).to eq("/bookstores/#{bookstore_1.id}/edit")
    end
  end
end
