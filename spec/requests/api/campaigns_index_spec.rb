require 'rails_helper'

RSpec.describe '/api/campaigns', type: :request do

  describe "GET#index" do
    it 'returns all campaigns' do
      FactoryGirl.create(:campaign, name: 'Solo Campaign')

      get campaigns_path(format: 'json')

      expect(response).to have_http_status(200)
      expect(response.body).to include_json(
        data: [
          { name: 'Solo Campaign' }
        ]
      )
    end
  end
end
