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
    @campaign = Campaign.find(params[:campaign_id])
    @scenario = Scenario.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @scenario = Scenario.find(params[:id])
    if @scenario.update(scenario_params)
      redirect_to campaign_scenario_path(@campaign, @scenario)
    else
      render 'edit'
    end
  end

  def edit
    @campaign = Campaign.find(params[:campaign_id])
    @scenario = Scenario.find(params[:id])
  end

  private

  def scenario_params
    params.require(:scenario).permit(:name, :victory_display, :resolution, :notes)
  end
end
