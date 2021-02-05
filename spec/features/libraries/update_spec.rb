require 'rails_helper'

RSpec.describe 'libraries update page' do
  it 'can create update information about a library' do
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
end
