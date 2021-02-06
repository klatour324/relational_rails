require 'rails_helper'

RSpec.describe 'books delete feature' do
  it 'can delete a book' do
    book_1 = Book.create({
      title: "Lord of the Rings Trilogy",
      checked_out: false,
      pages:1010})

    visit "/books/#{book_1.id}"

    click_on("Delete Book")

    expect(current_path).to eq("/books")
    expect(page).to have_no_content("Lord of the Rings Trilogy")
  end
end
