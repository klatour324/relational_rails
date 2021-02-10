require 'rails_helper'

RSpec.describe "libraries individual show page" do
  it "can show and individual library and its attributes" do
    library_1 = Library.create({
                name: "Chicago Public Library",
                public: true,
                years_opened: 150})

    visit "/libraries/#{library_1.id}"

    expect(page).to have_content(library_1.name)
    expect(page).to have_content(library_1.public)
    expect(page).to have_content(library_1.years_opened)
    expect(page).to have_content("Number of Books:")
  end

  it 'can update information about a library' do
    library_1 = Library.create({
                name: "Chicago Public Library",
                public: true,
                years_opened: 150})

    visit "/libraries/#{library_1.id}"

    expect(page).to have_link("Update Library")

    click_link "Update Library"

    expect(current_path).to eq("/libraries/#{library_1.id}/edit")

    fill_in('library_name', with: 'NYC Library')
    check('a_checkbox')
    fill_in('years_opened', with: 300)

    click_button "Submit"

    expect(current_path).to eq("/libraries/#{library_1.id}")
    expect(page).to have_content("NYC Library")
    expect(page).to have_content 300
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
end
