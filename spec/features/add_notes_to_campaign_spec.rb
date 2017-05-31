require 'rails_helper'

RSpec.describe "Add Notes to Campaign" do
  it "records notes on an existing campaign" do
    campaign = FactoryGirl.create(:campaign)
    visit campaign_path(campaign)

    page.fill_in "Notes", with: "Vital information"
    click_button "Save"
    visit root_path
    visit campaign_path(campaign)

    expect(page).to have_content("Vital information")
  end
end