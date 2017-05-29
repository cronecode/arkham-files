require 'rails_helper'

RSpec.describe "Add a new campaign" do
  it "button redirects to campaigns/new" do
    visit root_path
    click_link "Add new campaign"

    expect(page).to have_current_path("/campaigns/new")
  end

  it "creates a new campaign" do
    visit campaigns_new_path
    fill_in "Name", :with => "Night of the Zealot"
    click_button "Submit"

    expect(Campaign.count).to eq(1)
  end
end