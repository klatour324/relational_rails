require 'rails_helper'

RSpec.describe "books show page" do
  it "can show an individual book and its attributes" do
    books_1 = Book.create({
            title: "To Kill a Mockingbird",
            checked_out: true,
            pages: 487})

    visit "books/#{books_1.id}"

    expect(page).to have_link("Book Index")
    expect(page).to have_content(books_1.title)
    expect(page).to have_content(books_1.checked_out)
    expect(page).to have_content(books_1.pages)
    expect(page).to have_link("Update Book")
    expect(page).to have_link("Delete Book")
  end
end
