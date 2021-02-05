require 'rails_helper'

RSpec.describe "bookstores show page" do
  it "can a bookstore selected from all bookstores and its atttributes" do
    bookstore_1 = Bookstore.create({
      name: "Harriett's Bookshop",
      inventory: 3000,
      open: true})

    visit "/bookstores/#{bookstore_1.id}"

    expect(page).to have_content(bookstore_1.name)
    expect(page).to have_content(bookstore_1.inventory)
    expect(page).to have_content(bookstore_1.open)
  end

  it "can update a bookstore" do
    bookstore_1 = Bookstore.create({
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

    click_on("submit")

    expect(page).to have_content("Harriett's Club!")
    expect(page).to have_content(123456)
    expect(page).to have_content(true)
  end

  it "can delete a bookstore" do
    bookstore_1 = Bookstore.create({
      name: "Harriett's Bookshop",
      inventory: 3000,
      open: true})

    visit "/bookstores/#{bookstore_1.id}"
    click_on("Delete")

    expect(page).to have_content("All Bookstores")
    expect(page).to have_no_content("Harriett's Bookshop")
  end
end
