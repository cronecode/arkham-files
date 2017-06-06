require 'rails_helper'

RSpec.describe Scenario, type: :model do
  campaign = FactoryGirl.create(:campaign)
  puts campaign.inspect
  scenario = FactoryGirl.create(:scenario, name: "Foo", campaign_id: campaign.id)
  puts scenario.inspect

  it "should be valid" do
    expect(scenario).to be_valid
  end

  it "name should be present" do
    scenario.name = "    "
    expect(scenario).to_not be_valid
  end

  it "campaign id should be present" do
    scenario.campaign_id = nil
    expect(scenario).to_not be_valid
  end
end