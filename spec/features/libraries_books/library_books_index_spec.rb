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

  describe "Show records over a given threshold" do
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

      expect(page).to have_content("Please enter a number:")
      expect(page).to have_content("Only return records with more than 'n' number of pages")

      fill_in("title", with: 300)
      save_and_open_page
      click_button("Submit")

      expect(current_path).to eq("/libraries/#{library_1.id}/books")
      expect(page).to have_content(book_2.title)
      expect(page).to have_content(book_3.title)
      expect(page).to_not have_content(book_1.title)
    end
  end
end
