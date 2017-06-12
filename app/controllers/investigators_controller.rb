class InvestigatorsController < ApplicationController
  def new
    @campaign = Campaign.find(params[:campaign_id])
    @investigator = Investigator.new
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @investigator = Investigator.new(investigator_params.merge(campaign: @campaign))
    if @investigator.save
      redirect_to campaign_investigator_path(@campaign, @investigator)
    else
      render 'new'
    end
  end

  def show
    @campaign = Campaign.find(params[:campaign_id])
    @investigator = Investigator.find(params[:id])
  end

  private

  def investigator_params
    params.require(:investigator).permit(:name)
  end
end
