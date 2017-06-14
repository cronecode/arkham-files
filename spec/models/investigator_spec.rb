require 'rails_helper'

RSpec.describe Investigator, type: :model do
  it "should be valid" do
    investigator = FactoryGirl.create(:investigator)

    expect(investigator).to be_valid
  end

  it "name should be present" do
    investigator = FactoryGirl.create(:investigator)

    investigator.name = "      "

    expect(investigator).to_not be_valid
  end

  it "name should be unique" do
    investigator_1 = FactoryGirl.create(:investigator, name: "Rex")
    investigator_2 = FactoryGirl.create(:investigator, name: "Daisy")

    investigator_2.name = "Rex"

    expect(investigator_2).to_not be_valid
  end

  it "is active by default" do
    investigator = FactoryGirl.create(:investigator, name: "Rex Murphy")

    expect(investigator.status).to eq("ACTIVE")
  end
end
