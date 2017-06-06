require 'rails_helper'

RSpec.describe "Scenario Management", type: :feature do
  describe "Add a new scenario" do
    it "creates a scenario" do
      campaign = FactoryGirl.create(:campaign)
      visit campaign_path(campaign.id)
      click_link "Add Scenario"

      within("form") do
        fill_in "Name", :with => "The Gathering"
        click_button "Add scenario"
      end

      expect(page).to have_content("The Gathering")
    end
  end

  describe "View a scenario" do
    it "displays the scenario's information" do

    end
  end

  describe "Resolve a scenario" do
    it "records the outcome of a completed scenario" do

    end
  end

end


