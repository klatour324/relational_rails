require "rails_helper"

RSpec.describe "libraries index page" do
  it "can see all libraries names and created at attributes" do
    library_1 = Library.create!({
                name: "Chicago Public Library",
                public: true,
                years_opened: 150})
    library_2 = Library.create!({
                name: "Newberry Library",
                public: false,
                years_opened: 75})

    visit "/libraries"

    expect(page).to have_content(library_1.name)
    expect(page).to have_content(library_1.created_at)
    expect(page).to have_content(library_2.name)
    expect(page).to have_content(library_2.created_at)
  end

  it "can create a new library" do
    visit "/libraries"

    expect(page).to have_link("New Library")

    click_link "New Library"

    expect(current_path).to eq("/libraries/new")
    expect(page).to have_content("Enter a new Library:")

    fill_in("library_name", with: "Chicago Public Library")
    check("a_checkbox")
    fill_in("years_opened", with: 150)

    click_button "create_library"

    expect(current_path).to eq("/libraries")
    expect(page).to have_content("Chicago Public Library")
  end

  it "can update a library through individual edit link per library" do
    library_1 = Library.create!({
                name: "Chicago Public Library",
                public: true,
                years_opened: 150})
    library_2 = Library.create!({
                name: "Newberry Library",
                public: false,
                years_opened: 75})
    library_3 = Library.create!({
                name: "Hollywood Hills Library",
                public: false,
                years_opened: 75})

    visit "/libraries"

    expect(page).to have_link("Update Library")
    expect(page).to have_content("Chicago Public Library")
    expect(page).to have_content("Newberry Library")
    expect(page).to have_content("Hollywood Hills Library")

    click_link("Update Library", match: :first)

    expect(current_path).to eq("/libraries/#{library_3.id}/edit")
  end

  it "can delete a library through individual delete link for that library" do
    library_1 = Library.create!({
                name: "Chicago Public Library",
                public: true,
                years_opened: 150})
    library_2 = Library.create!({
                name: "Newberry Library",
                public: false,
                years_opened: 75})
    library_3 = Library.create!({
                name: "Hollywood Hills Library",
                public: false,
                years_opened: 75})

    visit "/libraries"

    expect(page).to have_link("Delete Library")
    expect(page).to have_content("Chicago Public Library")
    expect(page).to have_content("Newberry Library")
    expect(page).to have_content("Hollywood Hills Library")

    click_link("Delete Library", match: :first)

    expect(current_path).to eq("/libraries")
    expect(page).to_not have_content("Hollywood Hills Library")
    expect(page).to have_content("Chicago Public Library")
    expect(page).to have_content("Newberry Library")
  end

  it "can display link to books index page" do
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

    visit "/libraries"

    expect(page).to have_link("Books Index")
    expect(page).to have_content(library_1.name)
    expect(page).to have_link("Update Library")
    expect(page).to have_link("Delete Library")
  end
end
