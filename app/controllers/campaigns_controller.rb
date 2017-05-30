class CampaignsController < ApplicationController
  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(params[:name])
    if @campaign.save
      redirect_to root_url
    else
      render 'new'
    end
  end
end
