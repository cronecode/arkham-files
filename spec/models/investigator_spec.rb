require 'rails_helper'

RSpec.describe Investigator, type: :model do
  it "should be valid" do
    campaign = FactoryGirl.create(:campaign)
    investigator = FactoryGirl.create(:investigator, campaign_id: campaign.id)

    expect(investigator).to be_valid
  end

  it "name should be present" do
    campaign = FactoryGirl.create(:campaign)
    investigator = FactoryGirl.create(:investigator, campaign_id: campaign.id)

    investigator.name = "      "

    expect(investigator).to_not be_valid
  end

  it "name should be unique" do
    campaign = FactoryGirl.create(:campaign)
    investigator_1 = FactoryGirl.create(:investigator, campaign_id: campaign.id, name: "Rex")
    investigator_2 = FactoryGirl.create(:investigator, campaign_id: campaign.id, name: "Daisy")

    investigator_2.name = "Rex"

    expect(investigator_2).to_not be_valid
  end

  it "is active by default" do
    campaign = FactoryGirl.create(:campaign)
    investigator = FactoryGirl.create(:investigator, campaign_id: campaign.id, name: "Rex Murphy")

    expect(investigator.status).to eq("ACTIVE")
  end
end
