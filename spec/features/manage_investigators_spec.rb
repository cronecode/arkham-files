require 'rails_helper'

RSpec.describe "Investigator Management", type: :feature do
  describe "Add a new investigator" do
    it "creates a investigator" do
      campaign = FactoryGirl.create(:campaign)
      visit campaign_path(campaign)
      click_link "Add Investigator"

      expect do
        within("form") do
          fill_in "Name", with: "Agnes Baker"
          click_button "Save"
        end
      end.to change { Scenario.count }.by(1)
    end
  end
end
