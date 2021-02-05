require 'rails_helper'

RSpec.describe "libraries individual show page" do
  it "can show and individual library and its attributes" do
    libraries_1 = Library.create({
                name: "Chicago Public Library",
                public: true,
                years_opened: 150})
    libraries_2 = Library.create({
                name: "Newberry Library",
                public: false,
                years_opened: 75})

    visit "/libraries/#{libraries_1.id}"

    expect(page).to have_content(libraries_1.name)
    expect(page).to have_content(libraries_1.public)
    expect(page).to have_content(libraries_1.years_opened)
  end
end
