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
end
