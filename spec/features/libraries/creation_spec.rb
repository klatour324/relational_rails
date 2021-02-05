require 'rails_helper'

RSpec.describe 'libraries creation page' do
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
