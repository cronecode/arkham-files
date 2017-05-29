require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "GET #home" do
    render_views

    it "returns http success" do
      get :home

      expect(response.body).to have_content("Welcome to the Arkham Files")
      expect(response).to have_http_status(:success)
    end
  end
end
