require 'rails_helper'

feature "Deleting projects" do
  before do
    sign_in_as!(create(:admin_user))
  end
  scenario "Deleting a project" do
    create(:project, name: "Sublime Text 3")
    visit "/"
    click_link "Sublime Text 3"
    click_link "Delete Project"
    expect(page).to have_content "Project has been deleted."
    visit "/"
    expect(page).to have_no_content "Sublime Text 3"
  end
end
