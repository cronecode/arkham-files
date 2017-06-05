class ScenariosController < ApplicationController
  def new
    @campaign = Campaign.find params[:campaign_id]
    @scenario = Scenario.new(campaign: @campaign)
  end

  def create
    @campaign = Campaign.find params[:campaign_id]
    @scenario = Scenario.new(scenario_params)
    @campaign.scenarios << @scenario
    if @scenario.save
      redirect_to campaign_scenario_path(@campaign, @scenario)
    else
      render 'new'
    end
  end


  private

  def scenario_params
    params.require(:scenario).permit(:name, :campaign_id)
  end
end
