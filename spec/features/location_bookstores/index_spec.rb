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
    location_1 = Location.create! ({ name: "Philadelphia", population: 15000000, urban: true})
    bookstore_1 = location_1.bookstores.create! ({ name: "JimsBooks", inventory: 3000, open: false})

    visit "/locations/#{location_1.id}/bookstores"

    click_on("Create Bookstore")

    expect(current_path).to eq ("/locations/#{location_1.id}/bookstores/new")
    expect(page).to have_field("bs_name")
    expect(page).to have_field("bs_inv")
    expect(page).to have_field("open?")
  end

  it "can link to update bookstore page" do
    location_1 = Location.create! ({ name: "Philadelphia", population: 15000000, urban: true})
    bookstore_1 = location_1.bookstores.create! ({ name: "JimsBooks", inventory: 3000, open: false})

    visit "/locations/#{location_1.id}/bookstores"

    click_on("Update Bookstore")

    expect(current_path).to eq ("/bookstores/#{bookstore_1.id}/edit")
  end

  it "can click a link to delete a bookstore" do
    location_1 = Location.create! ({ name: "Philadelphia", population: 15000000, urban: true})
    bookstore_1 = location_1.bookstores.create! ({ name: "JimsBooks", inventory: 3000, open: false})

    visit "/locations/#{location_1.id}/bookstores"

    click_on("Delete Bookstore")

    expect(current_path).to eq ("/bookstores")
    expect(page).to_not have_content(bookstore_1.name)
  end

  it "can filter bookstores by input value from user" do
    location_1 = Location.create! ({ name: "Philadelphia", population: 15000000, urban: true})
    bookstore_1 = location_1.bookstores.create! ({ name: "JimsBooks", inventory: 3000, open: false})
    bookstore_2 = location_1.bookstores.create! ({ name: "Readon", inventory: 444, open: false})
    bookstore_3 = location_1.bookstores.create! ({ name: "Deals n Splills", inventory: 501, open: false})

    visit "/locations/#{location_1.id}/bookstores"
    fill_in :user_input_inventory, with: 500
    click_on 'Search Inventory'

    expect(current_path).to eq("/locations/#{location_1.id}/bookstores")
    expect(page).to have_no_content(bookstore_2.name)
    expect(page).to have_content(bookstore_3.name)
  end

  it "can sort bookstores by name after a button is clicked" do
    location_1 = Location.create! ({ name: "Philadelphia", population: 15000000, urban: true})
    bookstore_1 = location_1.bookstores.create! ({ name: "JimsBooks", inventory: 3000, open: false})
    bookstore_2 = location_1.bookstores.create! ({ name: "Readon", inventory: 444, open: false})
    bookstore_3 = location_1.bookstores.create! ({ name: "Deals n Splills", inventory: 501, open: false})

    visit "/locations/#{location_1.id}/bookstores"
    click_on 'Alphabetical Sort'

    expect(current_path).to eq("/locations/#{location_1.id}/bookstores")
  end

  it "can link to other location in the web app" do
    location_1 = Location.create! ({ name: "Philadelphia", population: 15000000, urban: true})
    bookstore_1 = location_1.bookstores.create! ({ name: "JimsBooks", inventory: 3000, open: false})

    visit "/locations/#{location_1.id}/bookstores"
    click_on 'Locations'

    expect(current_path).to eq("/locations")

    visit "/locations/#{location_1.id}/bookstores"
    click_on 'Bookstores'

    expect(current_path).to eq("/bookstores")
  end
end
