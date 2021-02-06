require 'rails_helper'

RSpec.describe "library_books creation" do
  it "can create a new book for a library" do
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

    visit "/libraries/#{library_1.id}/books/new"

    expect(page).to have_link("Create Book")

    click_link "Create Book"

    expect(current_path).to eq("/libraries/1/books/new")

    fill_in("title", with: book_1.title)
    check("a_checkbox")
    fill_in("pages", with: book_1.pages)

    click_button "Create Book"

    expect(current_path).to eq("/libraries/#{library_1.id}/books")
    expect(page).to have_content(book_1.title)
  end
end
