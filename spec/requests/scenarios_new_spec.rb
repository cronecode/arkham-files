require 'rails_helper'

RSpec.describe "/scenarios/new", type: :request do
  describe "GET#new" do
    it "displays the New Scenario view" do
      campaign = FactoryGirl.create(:campaign)
      get new_scenario_path

      expect(response).to have_http_status(:success)
    end
  end
end