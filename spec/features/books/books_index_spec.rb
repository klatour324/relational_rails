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

  expect(page).to  have_content(books_1.title)
  expect(page).to  have_content(books_1.checked_out)
  expect(page).to  have_content(books_1.pages)
  expect(page).to  have_content(books_2.title)
  expect(page).to  have_content(books_2.checked_out)
  expect(page).to  have_content(books_2.pages)
  end
end
