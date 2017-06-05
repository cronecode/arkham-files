require 'rails_helper'

RSpec.describe "/campaigns/:campaign_id/scenarios", type: :request do
  describe "POST#create" do
    it "creates a new scenario with a valid name" do
      campaign = FactoryGirl.create(:campaign)
      expect do
        post campaign_scenarios_path(campaign.id), params: { scenario: { name: "The Telltale Heart" } }
      end.to change { Campaign.count }.by(1)

      expect(response).to redirect_to campaign_scenario_url(Scenario.last)
    end
  end
end