require 'rails_helper'

RSpec.describe 'books update page' do
  it 'can update information about a book' do
    books_1 = Book.create({
                title: "A Mind for Numbers",
                checked_out: true,
                pages: 189})

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
end
