require 'rails_helper'

RSpec.describe Campaign, type: :model do
  it "does not exist before creation" do
    expect(Campaign.count).to eq(0)
  end

  it "exists after creation" do
    Campaign.create
    expect(Campaign.count).to eq(1)
  end
end