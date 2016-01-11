require "rails_helper"

feature "Smoke test" do
  scenario "loads the application" do
    visit root_path
    expect(page).to have_css ".title"
  end
end
