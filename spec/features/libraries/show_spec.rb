require 'rails_helper'

RSpec.describe "libraries individual show page" do
  it "can show and individual library and its attributes" do
    library_1 = Library.create!({
                name: "Chicago Public Library",
                public: true,
                years_opened: 150})

    visit "/libraries/#{library_1.id}"

    expect(page).to have_content(library_1.name)
    expect(page).to have_content(library_1.public)
    expect(page).to have_content(library_1.years_opened)
  end

  it "can see the number of books per library" do
    library_1 = Library.create({
                name: "Chicago Public Library",
                public: true,
                years_opened: 150})
    book_1 = library_1.books.create!(title: "To Kill a Mockingbird",
                                      checked_out: true,
                                      pages: 487)
    book_2 = library_1.books.create!(title: "The Handmaid's Tale",
                                      checked_out: false,
                                      pages: 227)
    book_3 = library_1.books.create!(title: "Oryx & Crake",
                                      checked_out: true,
                                      pages: 383)

    visit "libraries/#{library_1.id}"

    expect(page).to have_content("Number of Books:")
    expect(page).to have_content(library_1.books.count)
  end

  it 'can update information about a library to public' do
    library_1 = Library.create!({
                name: "Manhattan Library",
                public: false,
                years_opened: 250})
    library_2 = Library.create!({
                name: "Reading Rainbow Library",
                public: false,
                years_opened: 15})

    visit "/libraries/#{library_1.id}"

    expect(page).to have_link("Update Library")

    click_link "Update Library"

    expect(current_path).to eq("/libraries/#{library_1.id}/edit")

    fill_in('library_name', with: ' Manhattan Public Library')
    check('a_checkbox')
    fill_in('years_opened', with: 300)

    click_button "Submit"

    expect(current_path).to eq("/libraries/#{library_1.id}")
    expect(page).to have_content("Manhattan Public Library")
    expect(page).to have_content(300)
    expect(page).to have_content(true)
  end

  it 'can update information about a library to private' do
    library_1 = Library.create!({
                name: "Manhattan Library",
                public: false,
                years_opened: 250})
    library_2 = Library.create!({
                name: "Reading Rainbow Library",
                public: true,
                years_opened: 15})

    visit "/libraries/#{library_2.id}"

    expect(page).to have_link("Update Library")

    click_link "Update Library"

    expect(current_path).to eq("/libraries/#{library_2.id}/edit")

    fill_in('library_name', with: 'Reading Rainbow Private Library')
    uncheck('a_checkbox')
    fill_in('years_opened', with: 45)

    click_button "Submit"

    expect(current_path).to eq("/libraries/#{library_2.id}")
    expect(page).to have_content("Reading Rainbow Private Library")
    expect(page).to have_content(false)
    expect(page).to have_content(45)
  end

  it 'can delete a library' do
    library_1 = Library.create({
                name: "Chicago Public Library",
                public: true,
                years_opened: 150})

    visit "/libraries/#{library_1.id}"

    expect(page).to have_link("Delete Library")

    click_link "Delete Library"

    expect(current_path).to eq('/libraries')
    expect(page).to_not have_content("Chicago Public Library")
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

    library_2 = Library.create!(name: "Chicago Public Library",
                                public: true,
                                years_opened: 100)

    visit "/libraries/#{library_1.id}"

    expect(page).to have_link("Books Index")
    expect(page).to have_link("Library Index")
    expect(page).to have_link("Update Library")
    expect(page).to have_link("Delete Library")
    expect(page).to have_content(library_1.name)
    expect(page).to have_content(library_1.public)
    expect(page).to_not have_content(library_2.name)
  end
end
