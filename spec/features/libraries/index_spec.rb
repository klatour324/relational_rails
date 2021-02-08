require 'rails_helper'

RSpec.describe "libraries index page" do
  it "can see all libraries names with date and time created at" do
    libraries_1 = Library.create({
                name: "Chicago Public Library",
                public: true,
                years_opened: 150})
    libraries_2 = Library.create({
                name: "Newberry Library",
                public: false,
                years_opened: 75})

    visit "/libraries"

    expect(page).to have_content(libraries_1.name)
    expect(page).to have_content(libraries_1.created_at)
    expect(page).to have_content(libraries_2.name)
    expect(page).to have_content(libraries_2.created_at)
  end

  it 'can create a new library' do
    visit '/libraries'

    expect(page).to have_link('New Library')

    click_link 'New Library'

    expect(current_path).to eq('/libraries/new')
    expect(page).to have_content('Enter a new Library:')

    fill_in('library_name', with: 'Chicago Public Library')
    check('a_checkbox')
    fill_in('years_opened', with: 150)

    click_button 'create_library'

    expect(current_path).to eq('/libraries')
    expect(page).to have_link('Chicago Public Library')
  end
end
