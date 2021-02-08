require 'rails_helper'

RSpec.describe "books show page" do
  it "can show an individual book and its attributes" do
    library_1 = Library.create!(name: "Newberry Library",
                                public: false,
                                years_opened: 75)
    books_1 = library_1.books.create!(title: "A Mind for Numbers",
                                      checked_out: true,
                                      pages: 487)

    visit "/books/#{books_1.id}"

    expect(page).to have_link("Book Index")
    expect(page).to have_content(books_1.title)
    expect(page).to have_content(books_1.checked_out)
    expect(page).to have_content(books_1.pages)
    expect(page).to have_link("Update Book")
    expect(page).to have_link("Delete Book")
  end

  it 'can update information about a book' do
    library_1 = Library.create!(name: "Manhattan Library",
                               public: true,
                               years_opened: 200)
    books_1 = library_1.books.create!(title: "11/22/63",
                                      checked_out: false,
                                      pages: 989)

    visit "/books/#{books_1.id}"

    expect(page).to have_link("Update Book")

    click_link "Update Book"

    expect(current_path).to eq("/books/#{books_1.id}/edit")

    fill_in('book_title', with: 'A Mind for Numbers')
    check('a_checkbox')
    fill_in('pages', with: 189)

    click_button "Submit"

    expect(current_path).to eq("/books/#{books_1.id}")
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
    expect(page).to have_no_content("Lord of the Rings Trilogy")
  end
end
