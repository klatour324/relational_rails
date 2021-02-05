require 'rails_helper'

RSpec.describe "bookstores index page" do
  it "can see all bookstores and their atttributes (name, open?, inventory)" do
    bookstore_1 = BookStore.create({
      name: "Harriett's Bookshop",
      inventory: 3000,
      open: true})

    visit "/bookstores"

    expect(page).to have_content(bookstore_1.name)
    expect(page).to have_content(bookstore_1.inventory)
    expect(page).to have_content(bookstore_1.open)
    expect(page).to have_content(bookstore_1.created_at)
    expect(page).to have_content(bookstore_1.updated_at)
  end
end