require 'rails_helper'

RSpec.describe "Campaign Management", type: :feature do
  describe "Add a new campaign" do
    it "button redirects to campaigns/new" do
      visit root_path
      click_link "Add new campaign"

      expect(page).to have_current_path("/campaigns/new")
    end

    it "Create a new campaign" do
      visit new_campaign_path
      within("form") do
        fill_in "Name", :with => "Night of the Zealot"
        click_button "Add campaign"
      end

      expect(Campaign.count).to eq(1)
    end
  end

  describe "View a campaign" do
    it "redirects to the appropriate campaign page" do
      campaign = FactoryGirl.create(:campaign, name: "Dunwich Legacy")

      visit campaigns_path
      click_link "Dunwich Legacy"

      expect(page).to have_current_path("/campaigns/#{campaign.id}")
      expect(page).to have_content("This is the Dunwich Legacy campaign!")
    end
  end

  describe "View all campaigns" do
    it "button redirects to /campaigns" do
      visit root_path
      click_link "View my campaigns"

      expect(page).to have_current_path("/campaigns")
    end

    it "displays the list of created campaigns" do
      FactoryGirl.create(:campaign, name: "Dunwich Legacy")

      visit campaigns_path

      expect(page).to have_link("Dunwich Legacy")
    end
  end

  describe "Add/edit campaign notes" do
    it "records notes on an existing campaign" do
      campaign = FactoryGirl.create(:campaign)
      visit edit_campaign_path(campaign)

      page.fill_in campaign[:notes], with: "Vital information"
      click_button "Save"
      visit root_path
      visit campaign_path(campaign)

      expect(page).to have_content("Vital information")
    end
  end
end


