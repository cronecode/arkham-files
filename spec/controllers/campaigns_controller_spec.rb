require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do
  describe "GET #new" do
    render_views

    it "returns http success" do
      get :new

      expect(response.body).to have_content('Campaigns#new')
      expect(response).to have_http_status(:success)
    end
  end
end