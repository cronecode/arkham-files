require 'rails_helper'

RSpec.describe "/campaigns/:campaign_id/scenarios", type: :request do
  describe "POST#create" do
    it "creates a new scenario with a valid name" do
      campaign = FactoryGirl.create(:campaign)
      expect do
        post scenarios_path, params: { scenario: { name: "The Telltale Heart", campaign_id: campaign.id } }
      end.to change { Scenario.count }.by(1)

      expect(response).to redirect_to scenario_path(Scenario.last)
    end
  end
end