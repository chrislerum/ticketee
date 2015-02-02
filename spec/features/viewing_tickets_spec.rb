require 'rails_helper'

feature "Viewing tickets" do
  before do
    sublime = create(:project, name: "Sublime Text 3")
    create(:ticket, project: sublime, title: "Make it shiny!", description: "Gradients! Starbursts! Oh my!")
    ie = create(:project, name: "Internet Explorer")
    create(:ticket, project: ie, title: "Standards Compliance", description: "Isn't a joke.")
    visit "/"
  end

  scenario "for a given project" do
    click_link "Sublime Text 3"
    expect(page).to have_content "Make it shiny!"
    expect(page).to_not have_content "Standards Compliance"
    click_link "Make it shiny!"
    within("#ticket h2") do
      expect(page).to have_content("Make it shiny!")
    end
    expect(page).to have_content "Gradients! Starbursts! Oh my!"
  end
end
