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
                                    status: "killed")

    expect(investigator).to be_valid
  end

  it "has physical trauma" do
    campaign = FactoryGirl.create(:campaign)
    investigator = Investigator.new(campaign_id: campaign.id,
                                    name: "Rex Murphy",
                                    status: "killed",
                                    physical_trauma: 4)

    expect(investigator).to be_valid
  end

  it "has mental trauma" do
    campaign = FactoryGirl.create(:campaign)
    investigator = Investigator.new(campaign_id: campaign.id,
                                    name: "Rex Murphy",
                                    status: "killed",
                                    physical_trauma: 4,
                                    mental_trauma: 1)

    expect(investigator).to be_valid
  end

  it "has earned experience" do
    campaign = FactoryGirl.create(:campaign)
    investigator = Investigator.new(campaign_id: campaign.id,
                                    name: "Rex Murphy",
                                    status: "killed",
                                    physical_trauma: 4,
                                    mental_trauma: 1,
                                    experience_earned: 20)

    expect(investigator).to be_valid
  end

  it "has unspent experience" do
    campaign = FactoryGirl.create(:campaign)
    investigator = Investigator.new(campaign_id: campaign.id,
                                    name: "Rex Murphy",
                                    status: "killed",
                                    physical_trauma: 4,
                                    mental_trauma: 1,
                                    experience_earned: 20,
                                    unspent_experience: 3)

    expect(investigator).to be_valid
  end
end
