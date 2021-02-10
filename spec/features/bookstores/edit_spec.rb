require 'rails_helper'

RSpec.describe "bookstore edit page" do
  describe "can fill in a form and save the changes" do
    it "can update a bookstore name and inventory" do
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

      expect(page).to have_content(bookstore_1.name)
      expect(page).to have_content("Update information")

      fill_in("bs_name", with: "Harriett's Club!")
      fill_in("bs_inv", with: 123456)
      check('open?')

      click_on("Update Bookstore")

      expect(page).to have_content("Harriett's Club!")
      expect(page).to have_content(123456)
      expect(page).to have_content(true)
    end

    it "can update whether a bookstore is open begining from true" do
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
      uncheck("open?")
      click_on("Update Bookstore")

      visit "/bookstores/#{bookstore_1.id}"
      expect(page).to have_content("false")
      visit "/bookstores"
      expect(page).to_not have_content(bookstore_1.name)

      visit "/bookstores/#{bookstore_1.id}"
      click_on("Update Bookstore")
      check("open?")
      click_on("Update Bookstore")

      visit "/bookstores"
      expect(page).to have_content(bookstore_1.name)

    end

    it "can update whether a bookstore is open begining from false" do
      location_1 = Location.create! ({
        name: "Philadelphia",
        population: 15000000,
        urban: true})
      bookstore_1 = location_1.bookstores.create! ({
        name: "Harriett's Bookshop",
        inventory: 3000,
        open: false})

      visit "/bookstores/#{bookstore_1.id}"
      click_on("Update Bookstore")
      check("open?")
      click_on("Update Bookstore")

      expect(page).to have_content("true")
      visit "/bookstores"
      expect(page).to have_content(bookstore_1.name)
    end
  end
  describe "hyperlinks between web app pages" do
    it "can link to locations" do
      location_1 = Location.create! ({
        name: "Philadelphia",
        population: 15000000,
        urban: true})
      bookstore_1 = location_1.bookstores.create! ({
        name: "Harriett's Bookshop",
        inventory: 3000,
        open: false})

      visit "/bookstores/#{bookstore_1.id}/edit"
      click_on("Locations")

      expect(current_path).to eq ("/locations")
    end

    it "can link to bookstores" do
      location_1 = Location.create! ({
        name: "Philadelphia",
        population: 15000000,
        urban: true})
      bookstore_1 = location_1.bookstores.create! ({
        name: "Harriett's Bookshop",
        inventory: 3000,
        open: false})

      visit "/bookstores/#{bookstore_1.id}/edit"
      click_on("Bookstores")

      expect(current_path).to eq ("/bookstores")
    end
  end 
end
