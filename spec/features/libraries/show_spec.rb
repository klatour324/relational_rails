require 'rails_helper'

RSpec.describe "libraries individual show page" do
  it "can show and individual library and its attributes" do
    libraries_1 = Library.create({
                name: "Chicago Public Library",
                public: true,
                years_opened: 150})

    visit "/libraries/#{libraries_1.id}"

    expect(page).to have_content(libraries_1.name)
    expect(page).to have_content(libraries_1.public)
    expect(page).to have_content(libraries_1.years_opened)
    expect(page).to have_content("Number of Books:")
  end

  it 'can update information about a library' do
    libraries_1 = Library.create({
                name: "Chicago Public Library",
                public: true,
                years_opened: 150})

    visit "/libraries/#{libraries_1.id}"

    expect(page).to have_link("Update Library")

    click_link "Update Library"

    expect(current_path).to eq("/libraries/#{libraries_1.id}/edit")

    fill_in('library_name', with: 'Chicago Public Library')
    check('a_checkbox')
    fill_in('years_opened', with: 150)

    click_button "Submit"

    expect(current_path).to eq("/libraries/#{libraries_1.id}")
  end

  it 'can delete a library' do
    libraries_1 = Library.create({
                name: "Chicago Public Library",
                public: true,
                years_opened: 150})

    visit "/libraries/#{libraries_1.id}"

    expect(page).to have_link("Delete Library")

    click_link "Delete Library"

    expect(current_path).to eq('/libraries')
    expect(page).to_not have_content("Chicago Public Library")
  end
end
