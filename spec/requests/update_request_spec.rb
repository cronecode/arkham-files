require 'rails_helper'

RSpec.describe "/campaign/:id/edit" do
  describe "#PUT" do
    it "updates the campaign's notes" do
      campaign = FactoryGirl.create(:campaign)
      params = { notes: "blah" }

      put edit_campaign_path(campaign), params: params

      expect(response).to be_successful
      expect(response.body.notes).to eq("blah")
    end
  end

end