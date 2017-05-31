require 'rails_helper'

RSpec.describe "Add a new campaign" do
  it "button redirects to campaigns/new" do
    visit root_path
    click_link "Add new campaign"

    expect(page).to have_current_path("/campaigns/new")
  end

  it "creates a new campaign" do
    visit new_campaign_path
    within("form") do
      fill_in "Name", :with => "Night of the Zealot"
      click_button "Add campaign"
    end

    expect(Campaign.count).to eq(1)
  end

  it "redirects to the campaign page after creation" do
    visit new_campaign_path
    within("form") do
      fill_in "Name", :with => "Zealot"
      click_button "Add campaign"
    end

    #expect(page.current_url).to match(/campaigns\/\d/)
    expect(page).to have_content("This is the Zealot campaign!")


  end
end