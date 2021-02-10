require 'rails_helper'

RSpec.describe "books show page" do
  it "can show an individual book and its attributes" do
    library_1 = Library.create!(name: "Newberry Library",
                                public: false,
                                years_opened: 75)
    book_1 = library_1.books.create!(title: "A Mind for Numbers",
                                      checked_out: true,
                                      pages: 487)

    visit "/books/#{book_1.id}"

    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_1.checked_out)
    expect(page).to have_content(book_1.pages)
    expect(page).to have_link("Update Book")
    expect(page).to have_link("Delete Book")
  end

  it 'can update information about a book' do
    library_1 = Library.create!(name: "Manhattan Library",
                               public: true,
                               years_opened: 200)
    book_1 = library_1.books.create!(title: "11/22/63",
                                      checked_out: false,
                                      pages: 989)

    visit "/books/#{book_1.id}"

    expect(page).to have_link("Update Book")

    click_link "Update Book"

    expect(current_path).to eq("/books/#{book_1.id}/edit")

    fill_in('book_title', with: 'A Mind for Numbers')
    check('a_checkbox')
    fill_in('pages', with: 189)

    click_button "Submit"

    expect(current_path).to eq("/books/#{book_1.id}")
  end

  it 'can delete a book' do
    library_1 = Library.create!(name: "Logan Square Library",
                               public: true,
                               years_opened: 100)
    book_1 = library_1.books.create!(title: "Lord of the Rings Trilogy",
                                     checked_out: false,
                                     pages:1010)

    visit "/books/#{book_1.id}"

    expect(page).to have_link("Delete Book")

    click_link "Delete Book"

    expect(current_path).to eq("/books")
    expect(page).to_not have_content("Lord of the Rings Trilogy")
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

    visit "/books/#{book_1.id}"

    expect(page).to have_link("Books Index")
    expect(page).to have_link("Library Index")
    expect(page).to have_link("Update Book")
    expect(page).to have_link("Delete Book")
    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_1.checked_out)
    expect(page).to have_content(book_1.pages)
  end
end
