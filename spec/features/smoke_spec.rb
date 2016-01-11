require "rails_helper"

feature "Smoke test" do
  scenario "loads the application" do
    visit root_path
    expect(page).to have_css ".title"
  end

  scenario "works with organizations" do
    github = create(:organization, name: "GitHub")
    thoughtbot = create(:organization, name: "thoughtbot, inc.")

    create(:user, email: "person@example.com", organization: thoughtbot)

    visit organization_path(github)
    expect(page).to have_css "header", text: /thoughtbot/
  end

  scenario "when a new user is added" do
    github = create(:organization, name: "GitHub")
    thoughtbot = create(:organization, name: "thoughtbot, inc.")

    create(:user, email: "person@example.com", organization: thoughtbot)

    visit organization_path(thoughtbot)
    expect(page).to have_css "li", text: "person@example.com"

    create(:user, email: "person1@example.com", organization: thoughtbot)

    visit organization_path(thoughtbot)
    expect(page).to have_css "li", text: "person@example.com"
    expect(page).to have_css "li", text: "person1@example.com"
  end
end
