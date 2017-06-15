require 'rails_helper'

RSpec.describe Investigator, type: :model do
  it "should be valid" do
    campaign = FactoryGirl.create(:campaign)
    investigator = Investigator.create(campaign: campaign, name: "Agnes")

    valid = investigator.valid?

    expect(valid).to eq(true)
  end

  it "should be invalid if name is empty" do
    campaign = FactoryGirl.create(:campaign)
    investigator = Investigator.create(campaign: campaign, name: "Agnes")

    investigator.name = "      "
    valid = investigator.valid?

    expect(valid).to eq(false)
  end

  it "should be invalid if name is not unique" do
    campaign = FactoryGirl.create(:campaign)
    investigator_1 = Investigator.create(campaign: campaign, name: "Rex")
    investigator_2 = Investigator.create(campaign: campaign, name: "Agnes")

    investigator_2.name = "Rex"
    valid = investigator_2.valid?

    expect(valid).to eq(false)
  end

  it "should be active by default" do
    campaign = FactoryGirl.create(:campaign)
    investigator = Investigator.create(campaign: campaign, name: "Agnes")

    status = investigator.status

    expect(status).to eq("ACTIVE")
  end

  it "should be invalid with negative physical trauma" do
    campaign = FactoryGirl.create(:campaign)
    investigator = Investigator.create(campaign: campaign, name: "Agnes")

    investigator.physical_trauma = -1
    valid = investigator.valid?

    expect(valid).to eq(false)
  end

  it "should be invalid with negative mental trauma" do
    campaign = FactoryGirl.create(:campaign)
    investigator = Investigator.create(campaign: campaign, name: "Agnes")

    investigator.mental_trauma = -1
    valid = investigator.valid?

    expect(valid).to eq(false)
  end

  it "should be invalid with negative earned experience" do
    campaign = FactoryGirl.create(:campaign)
    investigator = Investigator.create(campaign: campaign, name: "Agnes")

    investigator.experience_earned = -1
    valid = investigator.valid?

    expect(valid).to eq(false)
  end
end
