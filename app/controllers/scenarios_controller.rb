class ScenariosController < ApplicationController
  def new
    @campaign = Campaign.find(params[:campaign_id])
    @scenario = Scenario.new
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @scenario = Scenario.new(scenario_params.merge(campaign: @campaign))
    if @scenario.save
      redirect_to campaign_scenario_path(@campaign, @scenario)
    else
      render 'new'
    end
  end

  def show
    @scenario = Scenario.find(params[:id])
  end

  private

  def scenario_params
    params.require(:scenario).permit(:name)
  end
end
