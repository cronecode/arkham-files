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
end