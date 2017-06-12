require 'rails_helper'

RSpec.describe Investigator, type: :model do
  it "has a name" do
    campaign = FactoryGirl.create(:campaign)
    investigator = Investigator.new(campaign_id: campaign.id,
                                    name: "Rex Murphy")

    expect(investigator).to be_valid
  end

  it "has a status" do
    campaign = FactoryGirl.create(:campaign)
    investigator = Investigator.new(campaign_id: campaign.id,
                                    name: "Rex Murphy",
                                    status: "dead")

    expect(investigator).to be_valid
  end

  it "has physical trauma" do
    campaign = FactoryGirl.create(:campaign)
    investigator = Investigator.new(campaign_id: campaign.id,
                                    name: "Rex Murphy",
                                    status: "dead",
                                    physical_trauma: 4)

    expect(investigator).to be_valid
  end

  it "has mental trauma" do
    campaign = FactoryGirl.create(:campaign)
    investigator = Investigator.new(campaign_id: campaign.id,
                                    name: "Rex Murphy",
                                    status: "dead",
                                    physical_trauma: 4,
                                    mental_trauma: 1)

    expect(investigator).to be_valid
  end
end
