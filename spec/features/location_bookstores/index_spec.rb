require 'rails_helper'

RSpec.describe "location_bookstores index page" do
  it "can see all associated bookstores and attributes" do
    location_1 = Location.create! ({ name: "Philadelphia", population: 15000000, urban: true})
    bookstore_1 = location_1.bookstores.create! ({ name: "JimsBooks", inventory: 3000, open: false})
    bookstore_2 = location_1.bookstores.create! ({ name: "Readon", inventory: 444, open: false})

    visit "/locations/#{location_1.id}/bookstores"

    expect(page).to have_content("Bookstores")
    expect(page).to have_content(location_1.name)
    expect(page).to have_link(bookstore_1.name)
    expect(page).to have_content(bookstore_1.inventory)
    expect(page).to have_content(bookstore_1.open)
    expect(page).to have_link(bookstore_2.name)
    expect(page).to have_content(bookstore_2.inventory)
    expect(page).to have_content(bookstore_2.open)
  end

  it "can link to create a new bookstore page" do
    location_1 = Location.create! ({
      name: "Philadelphia",
      population: 15000000,
      urban: true})

    visit "/locations/#{location_1.id}/bookstores"

    click_on("New Bookstore")

    expect(page).to have_field("bs_name")
    expect(page).to have_field("bs_inv")
    expect(page).to have_field("open?")
  end

  it "can filter bookstores by input value from user" do
    location_1 = Location.create! ({ name: "Philadelphia", population: 15000000, urban: true})
    bookstore_1 = location_1.bookstores.create! ({ name: "JimsBooks", inventory: 3000, open: false})
    bookstore_2 = location_1.bookstores.create! ({ name: "Readon", inventory: 444, open: false})

    visit "/locations/#{location_1.id}/bookstores"
    fill_in :user_input_inventory, with: 500
    click_on 'Search Inventory'

    expect(current_path).to eq("/locations/#{location_1.id}/bookstores")
    expect(page).to have_no_content(bookstore_2.name)
  end
end
