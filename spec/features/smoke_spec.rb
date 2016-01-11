require "rails_helper"

feature "Smoke test" do
  scenario "loads the application" do
    visit root_path
    expect(page).to have_css ".title"
  end

  scenario "works with organizations" do
    github = create(:organization, name: "GitHub")
    thoughtbot = create(:organization, name: "thoughtbot, inc.")

    user = create(:user, name: "Joe", email: "person@example.com", organization: thoughtbot)

    visit organization_path(github)
    expect(page).to have_css "header", text: /thoughtbot/
  end
end
