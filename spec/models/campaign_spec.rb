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
end