require 'rails_helper'

RSpec.describe "/campaign/:id" do
  describe "#PUT" do
    it "updates the campaign's notes" do
      @campaign = FactoryGirl.create(:campaign)
      params = { campaign: { notes: "blah" } }

      put campaign_path(@campaign), params: params

      expect(response).to be_successful
      expect(response.body.notes).to eq("blah")
    end
  end

end