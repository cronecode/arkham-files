class ScenariosController < ApplicationController
  def new
    @campaign = Campaign.find params[:campaign_id]
    @scenario = Scenario.new(campaign: @campaign)
  end
end
