module Api
  class CampaignsController < ApiController
    def index
      @campaigns = Campaign.all

      respond_to do |format|
        format.json { render json: { data: @campaigns } }
      end
    end
  end
end

