require 'rails_helper'

feature "Users can sign up" do
  scenario "when providing valid credentials" do
    visit "/"
    click_link "Sign up"
    #fill_in "Email", with: "test@example.com"
    #fill_in "user_password", with: "password"
    #fill_in "password_confirmation", with: "password"
    #click_button "Sign up"
    #expect(page).to have_content "You have signed up successfully."
  end
end
