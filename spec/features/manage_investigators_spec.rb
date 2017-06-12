require 'rails_helper'

RSpec.describe "Investigator Management", type: :feature do
  describe "Add a new investigator" do
    it "creates a investigator" do
      campaign = FactoryGirl.create(:campaign)
      visit campaign_path(campaign)
      click_link "Add Investigator"

      within("form") do
        fill_in "Name", with: "Agnes Baker"
        click_button "Save"
      end

      expect(page).to have_content("Agnes Baker")
    end
  end

  describe "View investigator stats" do
    it "displays an investigator's information" do
      campaign = FactoryGirl.create(:campaign)
      FactoryGirl.create(:investigator,
                         name:               "Skids",
                         campaign_id:        campaign.id,
                         status:             "Insane",
                         physical_trauma:    2,
                         mental_trauma:      6,
                         experience_earned:  10,
                         unspent_experience: 5)

      visit campaign_path(campaign)
      click_link "Skids"

      expect(page).to have_field("Status", with: "Insane")
      expect(page).to have_field("Physical Trauma", value: 2)
      expect(page).to have_field("Mental Trauma", value: 6)
      expect(page).to have_field("Experience Earned", value: 10)
      expect(page).to have_field("Unspent Experience", value: 5)

    end
  end
end
