require 'rails_helper'

RSpec.describe "books index page" do
  it "can see all books and their atttributes" do
    books_1 = Book.create({
            title: "To Kill a Mockingbird",
            checked_out: true,
            pages: 487})
    books_2 = Book.create({
            title: "The Handmaid's Tale",
            checked_out: false,
            pages: 227})

  visit '/books'

  expect(page).to have_content("All Books")
  expect(page).to have_link("New Book")
  expect(page).to  have_link(books_1.title)
  expect(page).to  have_link(books_2.title)
  end
end
