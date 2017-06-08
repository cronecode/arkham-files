require 'rails_helper'

RSpec.describe Scenario, type: :model do
  it "should be valid" do
    campaign = FactoryGirl.create(:campaign)
    scenario = FactoryGirl.create(:scenario, name: "Foo", campaign_id: campaign.id)

    expect(scenario).to be_valid
  end

  it "name should be present" do
    campaign = FactoryGirl.create(:campaign)
    scenario = FactoryGirl.create(:scenario, name: "Foo", campaign_id: campaign.id)

    scenario.name = "    "

    expect(scenario).to_not be_valid
  end

  it "campaign id should be present" do
    campaign = FactoryGirl.create(:campaign)
    scenario = FactoryGirl.create(:scenario, name: "Foo", campaign_id: campaign.id)

    scenario.campaign_id = nil

    expect(scenario).to_not be_valid
  end

  it "may have notes" do
    campaign = FactoryGirl.create(:campaign)
    scenario = FactoryGirl.create(:scenario, name: "Foo", campaign_id: campaign.id, notes: "I'm a note!")

    expect(scenario).to be_valid
  end

  it "notes are not blank" do
    campaign = FactoryGirl.create(:campaign)
    scenario = FactoryGirl.create(:scenario, name: "Foo", campaign_id: campaign.id, notes: "I'm a note!")

    scenario.notes = "    "

    expect(scenario).to_not be_valid
  end

  it "victory_display should be present" do
    campaign = FactoryGirl.create(:campaign)
    scenario = FactoryGirl.create(:scenario, name: "Foo", campaign_id: campaign.id, victory_display: 0)

    scenario.victory_display = nil

    expect(scenario).to_not be_valid
  end

  it "victory_display is a non-negative integer" do
    campaign = FactoryGirl.create(:campaign)
    scenario = FactoryGirl.create(:scenario, name: "Foo", campaign_id: campaign.id, victory_display: 0)

    scenario.victory_display = -1

    expect(scenario).to_not be_valid
  end
end