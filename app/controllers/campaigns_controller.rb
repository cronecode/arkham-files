class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
    @scenarios = @campaign.scenarios.order(:order)
    @investigators = @campaign.investigators
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      redirect_to edit_campaign_url(@campaign)
    else
      render 'new'
    end
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update(campaign_params)
      redirect_back(fallback_location: campaign_url(@campaign))
    end
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def destroy
    Campaign.find(params[:id]).destroy
    redirect_to campaigns_path
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name, :notes, :cycle)
  end
end
