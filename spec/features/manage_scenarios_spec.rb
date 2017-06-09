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

      expect(Scenario.count).to eq(1)
    end
  end

  describe "View a scenario" do
    it "displays the scenario's information" do
      campaign = FactoryGirl.create(:campaign)
      scenario = FactoryGirl.create(:scenario, name: "The Gathering", campaign_id: campaign.id)

      visit campaign_scenario_path(campaign, scenario)

      expect(page).to have_content(Scenario.last.name)
    end
  end

  describe "Resolve a scenario" do
    it "records the outcome of a completed scenario" do
      campaign = FactoryGirl.create(:campaign)
      scenario = FactoryGirl.create(:scenario, name: "Midnight Masks", campaign_id: campaign.id)

      visit campaign_scenario_path(campaign, scenario)
      click_link "Resolve"

      within("form") do
        fill_in "Victory Display", with: 10
        select 'R2', from: 'Resolution'
        click_button "Save"
      end

      expect(page).to have_content("R2")
    end
  end
end