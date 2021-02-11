require "rails_helper"

RSpec.describe "books index page" do
  it "can see all books titles that are checked out" do
    library_1 = Library.create!(name: "Harold Washington Library",
                                public: true,
                                years_opened: 75)
    book_1 = library_1.books.create!(title: "To Kill a Mockingbird",
                                      checked_out: true,
                                      pages: 487)
    book_2 = library_1.books.create!(title: "The Handmaid's Tale",
                                      checked_out: false,
                                      pages: 227)
    book_3 = library_1.books.create!(title: "Oryx & Crake",
                                      checked_out: true,
                                      pages: 383)

  visit "/books"

  expect(page).to have_content("All Books")
  expect(page).to  have_link(book_1.title)
  expect(page).to  have_link(book_3.title)
  expect(page).to_not  have_link(book_2.title)
  end

  it "can update books information from books index page" do
    library_1 = Library.create!(name: "Harold Washington Library",
                                public: true,
                                years_opened: 75)
    book_1 = library_1.books.create!(title: "To Kill a Mockingbird",
                                      checked_out: true,
                                      pages: 487)
    book_2 = library_1.books.create!(title: "The Handmaid's Tale",
                                      checked_out: false,
                                      pages: 227)
    book_3 = library_1.books.create!(title: "Oryx & Crake",
                                      checked_out: true,
                                      pages: 383)

    visit "/books"

    expect(page).to have_link("Update Book")
    expect(page).to have_link(book_1.title)
    expect(page).to have_link(book_3.title)

    click_link("Update Book", match: :first)

    expect(current_path).to eq("/books/#{book_1.id}/edit")
  end

  it "can delete a book through individual delete link for that book" do
    library_1 = Library.create!(name: "Harold Washington Library",
                                public: true,
                                years_opened: 75)
    book_1 = library_1.books.create!(title: "To Kill a Mockingbird",
                                      checked_out: true,
                                      pages: 487)
    book_2 = library_1.books.create!(title: "The Handmaid's Tale",
                                      checked_out: false,
                                      pages: 227)
    book_3 = library_1.books.create!(title: "Oryx & Crake",
                                      checked_out: true,
                                      pages: 383)

  visit "/books"

  expect(page).to have_content("All Books")
  expect(page).to have_link("Delete Book")
  expect(page).to  have_link(book_1.title)
  expect(page).to  have_link(book_3.title)

  click_link("Delete Book", match: :first)

  expect(current_path).to eq("/books")
  expect(page).to_not  have_content(book_1.title)
  expect(page).to  have_content(book_3.title)
  end

  it "can display link to library index page" do
    library_1 = Library.create!(name: "Harold Washington Library",
                                public: true,
                                years_opened: 75)
    book_1 = library_1.books.create!(title: "To Kill a Mockingbird",
                                      checked_out: true,
                                      pages: 487)
    book_2 = library_1.books.create!(title: "The Handmaid's Tale",
                                      checked_out: false,
                                      pages: 227)
    book_3 = library_1.books.create!(title: "Oryx & Crake",
                                      checked_out: true,
                                      pages: 383)

    visit "/books"

    expect(page).to have_link("Library Index")
    expect(page).to have_link(book_1.title)
    expect(page).to have_link(book_3.title)
    expect(page).to_not have_link(book_2.title)
    expect(page).to have_link("Update Book")
    expect(page).to have_link("Delete Book")
  end
end
