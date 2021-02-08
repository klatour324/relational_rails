require 'rails_helper'

RSpec.describe "books index page" do
  it "can see all books titles" do
    library_1 = Library.create!(name: "Harold Washington Library",
                                public: true,
                                years_opened: 75)
    books_1 = library_1.books.create!(title: "To Kill a Mockingbird",
                                      checked_out: true,
                                      pages: 487)
    books_2 = library_1.books.create!(title: "The Handmaid's Tale",
                                      checked_out: false,
                                      pages: 227)

  visit '/books'

  expect(page).to have_content("All Books")
  expect(page).to have_link("New Book")
  expect(page).to  have_link(books_1.title)
  expect(page).to  have_link(books_2.title)
  end
end
