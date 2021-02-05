require 'rails_helper'

RSpec.describe 'libraries delete page' do
  it 'can delete a library' do
    libraries_1 = Library.create({
                name: "Chicago Public Library",
                public: true,
                years_opened: 150})

    visit "/libraries/#{libraries_1.id}"

    expect(page).to have_link("Delete Library")

    click_link "Delete Library"

    expect(current_path).to eq('/libraries')
    expect(page).to have_no_content("Chicago Public Library")
  end
end
