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
                                    status: "KILLED")

    expect(investigator).to be_valid
  end

  it "is active by default" do
    campaign = FactoryGirl.create(:campaign)
    investigator = FactoryGirl.create(:investigator, campaign_id: campaign.id, name: "Rex Murphy")

    expect(investigator.status).to eq("ACTIVE")
  end

  it "has physical trauma" do
    campaign = FactoryGirl.create(:campaign)
    investigator = Investigator.new(campaign_id: campaign.id,
                                    name: "Rex Murphy",
                                    status: "KILLED",
                                    physical_trauma: 4)

    expect(investigator).to be_valid
  end

  it "has 0 physical trauma by default" do
    campaign = FactoryGirl.create(:campaign)
    investigator = FactoryGirl.create(:investigator, campaign_id: campaign.id, name: "Rex Murphy")

    expect(investigator.physical_trauma).to eq(0)
  end

  it "has mental trauma" do
    campaign = FactoryGirl.create(:campaign)
    investigator = Investigator.new(campaign_id: campaign.id,
                                    name: "Rex Murphy",
                                    status: "KILLED",
                                    physical_trauma: 4,
                                    mental_trauma: 1)

    expect(investigator).to be_valid
  end

  it "has 0 mental trauma by default" do
    campaign = FactoryGirl.create(:campaign)
    investigator = FactoryGirl.create(:investigator, campaign_id: campaign.id, name: "Rex Murphy")

    expect(investigator.mental_trauma).to eq(0)
  end

  it "has earned experience" do
    campaign = FactoryGirl.create(:campaign)
    investigator = Investigator.new(campaign_id: campaign.id,
                                    name: "Rex Murphy",
                                    status: "KILLED",
                                    physical_trauma: 4,
                                    mental_trauma: 1,
                                    experience_earned: 20)

    expect(investigator).to be_valid
  end

  it "has earned 0 experience by default" do
    campaign = FactoryGirl.create(:campaign)
    investigator = FactoryGirl.create(:investigator, campaign_id: campaign.id, name: "Rex Murphy")

    expect(investigator.experience_earned).to eq(0)
  end

  it "has unspent experience" do
    campaign = FactoryGirl.create(:campaign)
    investigator = Investigator.new(campaign_id: campaign.id,
                                    name: "Rex Murphy",
                                    status: "KILLED",
                                    physical_trauma: 4,
                                    mental_trauma: 1,
                                    experience_earned: 20,
                                    unspent_experience: 3)

    expect(investigator).to be_valid
  end

  it "has 0 unspent experience by default" do
    campaign = FactoryGirl.create(:campaign)
    investigator = FactoryGirl.create(:investigator, campaign_id: campaign.id, name: "Rex Murphy")

    expect(investigator.unspent_experience).to eq(0)
  end
end
