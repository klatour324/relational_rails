require 'rails_helper'

RSpec.describe "library_books creation" do
  it "can create a new book for a library" do
    library_1 = Library.create!(name: "Chicago Public Library",
                                public: true,
                                years_opened: 150)

    visit "/libraries/#{library_1.id}/books"

    expect(page).to have_link("Create Book")

    click_link "Create Book"

    expect(current_path).to eq("/libraries/#{library_1.id}/books/new")
    expect(page).to have_content("Add a New Book")

    fill_in("book_title", with: "A Mind for Numbers")
    check("a_checkbox")
    fill_in("pages", with: 267)

    click_button "Create Book"

    expect(current_path).to eq("/libraries/#{library_1.id}/books")
    expect(page).to have_content("A Mind for Numbers")
  end

  it "can display links to books index page and library index page" do
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

    visit "/libraries/#{library_1.id}/books/new"

    expect(page).to have_link("Books Index")
    expect(page).to have_link("Library Index")
    expect(page).to have_content("Enter Book Information:")
    expect(page).to have_button("Create Book")
    expect(page).to have_content("Title")
    expect(page).to have_content("Checked Out?")
    expect(page).to have_content("Number of Pages")
  end
end
