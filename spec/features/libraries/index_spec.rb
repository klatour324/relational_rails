require 'rails_helper'

RSpec.describe "libraries index page" do
  it "can see all libraries names" do
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
    expect(page).to have_content(libraries_2.name)
  end
end
