require 'rails_helper'

RSpec.describe "bookstores show page" do
  it "can a bookstore selected from all bookstores and their atttributes" do
    book_store_1 = BookStore.create({
      name: "Harriett's Bookshop",
      inventory: 3000,
      open: true})

    visit "/book_stores/#{book_store1.id}"

    expect(page).to have_content(book_store_1.name)
    expect(page).to have_content(book_store_1.inventory)
    expect(page).to have_content(book_store_1.open)
    expect(page).to have_content(book_store_1.created_at)
    expect(page).to have_content(book_store_1.updated_at)
  end
end
