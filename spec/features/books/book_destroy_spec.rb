require 'rails_helper'

RSpec.describe 'books delete feature' do
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
