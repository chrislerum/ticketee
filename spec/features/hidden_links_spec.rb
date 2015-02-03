require 'rails_helper'

feature "hidden links" do
  let(:user) {create :user}
  let(:admin) {create :admin_user}
  let(:project) {create :project}

  context "anonymous users" do
    scenario "cannot see the New Project link" do
      visit '/'
      assert_no_link_for "New Project"
    end

    scenario "cannot see the Edit Project link" do
      visit project_path(project)
      assert_no_link_for "Edit Project"
    end

    scenario "cannot see the Delete Project link" do
      visit project_path(project)
      assert_no_link_for "Delete Project"
    end
  end

  context "regular users" do
    before { sign_in_as!(user) }
    scenario "cannot see the New Project link" do
      visit '/'
      assert_no_link_for "New Project"
    end

    scenario "cannot see the Edit Project link" do
      visit project_path(project)
      assert_no_link_for "Edit Project"
    end

    scenario "cannot see the Delete Project link" do
      visit project_path(project)
      assert_no_link_for "Delete Project"
    end
  end

  context "admin users" do
    before { sign_in_as!(admin) }
    scenario "can see the New Project link" do
      visit '/'
      assert_link_for "New Project"
    end

    scenario "cannot see the Edit Project link" do
      visit project_path(project)
      assert_link_for "Edit Project"
    end

    scenario "cannot see the Delete Project link" do
      visit project_path(project)
      assert_link_for "Delete Project"
    end
  end
end
