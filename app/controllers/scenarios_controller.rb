class ScenariosController < ApplicationController
  def new
    @scenario = Scenario.new
  end

  def create
    @scenario = Scenario.new(scenario_params)
    if @scenario.save
      redirect_to scenario_path(@scenario)
    else
      render 'new'
    end
  end

  def show
    @scenario = Scenario.find(params[:id])
  end

  private

  def scenario_params
    params.require(:scenario).permit(:name, :campaign_id)
  end
end
