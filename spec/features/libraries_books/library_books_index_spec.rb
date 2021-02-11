require 'rails_helper'

RSpec.describe "library_books index page" do
  it "can show all books and their attributes associated with the library" do
    library_1 = Library.create!({
      name: "Chicago Public Library",
      public: true,
      years_opened: 150})
    book_1 = library_1.books.create!({
      title: "Pachinko",
      checked_out: true,
      pages: 254})
    book_2 = library_1.books.create!({
      title: "The World's Fair",
      checked_out: false,
      pages: 484})

    visit "/libraries/#{library_1.id}/books"

    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_1.checked_out)
    expect(page).to have_content(book_1.pages)
    expect(page).to have_content(book_2.title)
    expect(page).to have_content(book_2.checked_out)
    expect(page).to have_content(book_2.pages)
  end

  it "can only return books with a certain number of pages" do
    library_1 = Library.create!({
      name: "Chicago Public Library",
      public: true,
      years_opened: 150})
    book_1 = library_1.books.create!({
      title: "Pachinko",
      checked_out: true,
      pages: 254})
    book_2 = library_1.books.create!({
      title: "The World's Fair",
      checked_out: false,
      pages: 484})
    book_3 = library_1.books.create!({
      title: "All About Champagne",
      checked_out: true,
      pages: 675})

    visit "/libraries/#{library_1.id}/books"

    expect(page).to have_content("Only return records with more than 'n' number of pages")

    fill_in('title', with: 300)

    click_button("Submit")

    expect(current_path).to eq("/libraries/#{library_1.id}/books")
    expect(page).to have_content(book_2.title)
    expect(page).to have_content(book_3.title)
    expect(page).to_not have_content(book_1.title)
  end

  it 'can sort books alphabetically for a specific library' do
    library_1 = Library.create!({
      name: "Chicago Public Library",
      public: true,
      years_opened: 150})
    book_1 = library_1.books.create!({
      title: "Pachinko",
      checked_out: true,
      pages: 254})
    book_2 = library_1.books.create!({
      title: "The World's Fair",
      checked_out: false,
      pages: 484})
    book_3 = library_1.books.create!({
      title: "All About Champagne",
      checked_out: true,
      pages: 675})

    visit "/libraries/#{library_1.id}/books"

    expect(page).to have_button('Sort Books Alphabetically')

    click_button('Sort Books Alphabetically')

    expect(current_path).to eq("/libraries/#{library_1.id}/books")

    this = (book_3.title)
    that = (book_2.title)

    expect(this).to appear_before(that)
  end

  it 'can update book information from library_books index page' do
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

    visit "/libraries/#{library_1.id}/books"

    expect(page).to have_link("Update Book")
    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_2.title)
    expect(page).to have_content(book_3.title)

    click_link("Update Book", match: :first)

    expect(current_path).to eq("/books/#{book_1.id}/edit")
  end

    it "can delete a book on library_books index page through individual delete link" do
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

    visit "/libraries/#{library_1.id}/books"

    expect(page).to have_link("Delete Book")
    expect(page).to  have_content(book_1.title)
    expect(page).to  have_content(book_2.title)
    expect(page).to  have_content(book_3.title)

    click_link("Delete Book", match: :first)

    expect(current_path).to eq("/books")
    expect(page).to_not  have_content(book_2.title)
    expect(page).to_not  have_content(book_1.title)
    expect(page).to  have_content(book_3.title)
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

    visit "/libraries/#{library_1.id}/books"

    expect(page).to have_link("Books Index")
    expect(page).to have_link("Library Index")
    expect(page).to have_link("Update Book")
    expect(page).to have_link("Delete Book")
    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_2.title)
    expect(page).to have_content(book_3.title)
  end
end
