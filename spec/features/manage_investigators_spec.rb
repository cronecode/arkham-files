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

      puts page.html

      expect(page).to have_text("Status: Insane")
      expect(page).to have_text("Physical Trauma: 2")
      expect(page).to have_text("Mental Trauma: 6")
      expect(page).to have_text("Experience Earned: 10")
      expect(page).to have_text("Unspent Experience: 5")

    end
  end
end
