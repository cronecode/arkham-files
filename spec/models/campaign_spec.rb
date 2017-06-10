require 'rails_helper'

RSpec.describe Campaign, type: :model do
  it "is valid" do
    campaign = FactoryGirl.create(:campaign)

    expect(campaign).to be_valid
  end

  it "has a name" do
    campaign = FactoryGirl.create(:campaign)

    campaign.name = "     "

    expect(campaign).to_not be_valid
  end

  it "removes its scenarios when deleted" do
    campaign = FactoryGirl.create(:campaign)
    scenario = FactoryGirl.create(:scenario, campaign_id: campaign.id)

    expect do
      campaign.destroy
    end.to change { Scenario.count }.by(-1)
  end
end