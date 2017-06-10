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

  it "may have victory_display" do
    campaign = FactoryGirl.create(:campaign)
    scenario = FactoryGirl.create(:scenario, name: "Foo", campaign_id: campaign.id, victory_display: 0)

    expect(scenario).to be_valid
  end

  it "victory_display is a non-negative integer" do
    campaign = FactoryGirl.create(:campaign)
    scenario = FactoryGirl.create(:scenario, name: "Foo", campaign_id: campaign.id, victory_display: 0)

    scenario.victory_display = -1

    expect(scenario).to_not be_valid
  end

  it "may have a resolution" do
    campaign = FactoryGirl.create(:campaign)
    scenario = FactoryGirl.create(:scenario, name: "Foo", campaign_id: campaign.id, resolution: 0)

    expect(scenario).to be_valid
    expect(scenario.resolution).to eq("no_resolution")
  end

  it "is ordered within the campaign" do
    campaign = FactoryGirl.create(:campaign)
    scenario = FactoryGirl.create(:scenario, name: "Foo", campaign_id: campaign.id, order: 3)

    scenario.order = nil

    expect(scenario).to_not be_valid
  end

  it "#order is an integer >= 1" do
    campaign = FactoryGirl.create(:campaign)
    scenario = FactoryGirl.create(:scenario, name: "Foo", campaign_id: campaign.id, order: 3)

    scenario.order = 0

    expect(scenario).to_not be_valid
  end

  it "#order is unique among the campaign's scenarios" do
    campaign = FactoryGirl.create(:campaign)
    scenario = FactoryGirl.create(:scenario, name: "Foo", campaign_id: campaign.id, order: 3)
    scenario2 = FactoryGirl.create(:scenario, name: "Bar", campaign_id: campaign.id, order: 4)

    scenario2.order = 3

    expect(scenario2).to_not be_valid
  end
end