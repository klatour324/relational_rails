require 'rails_helper'

RSpec.describe "library_books index page" do
  it "can show all books and their attributes associated with the library" do
    library_1 = Library.create({
      name: "Chicago Public Library",
      public: true,
      years_opened: 150})
    book_1 = Book.create({
      title: "Pachinko",
      checked_out: true,
      pages: 254})
    book_2 = Book.new({
      title: "The World's Fair",
      check_out: false,
      pages: 484})

  visit "/libraries/#{library_1.id}/books"

  expect(page).to have_content(book_1.title)
  expect(page).to have_content(book_1.checked_out)
  expect(page).to have_content(book_1.pages)
  end
end
