require 'rails_helper'

RSpec.describe "/campaign/:id", type: :request do
  describe "#PUT" do
    it "updates the campaign's notes" do
      campaign = FactoryGirl.create(:campaign)
      params = { campaign: { notes: "blah" } }

      put campaign_path(campaign), params: params

      follow_redirect!
      expect(response.body).to include("blah")
    end
  end
end