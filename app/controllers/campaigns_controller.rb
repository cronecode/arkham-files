class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      redirect_to campaign_url(@campaign.id)
    else
      render 'new'
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name)
  end
end
