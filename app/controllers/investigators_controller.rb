class InvestigatorsController < ApplicationController
  def new
    @campaign = Campaign.find(params[:campaign_id])
    @investigator = Investigator.new
  end
end
