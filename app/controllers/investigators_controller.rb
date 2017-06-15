class InvestigatorsController < ApplicationController
  def new
    @campaign = Campaign.find(params[:campaign_id])
    @investigator = Investigator.new

    @names = remaining_investigators
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

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @investigator = Investigator.find(params[:id])
    if @investigator.update(investigator_params)
      redirect_to campaign_investigator_path(@campaign, @investigator)
    else
      render 'edit'
    end
  end

  def edit
    @campaign = Campaign.find(params[:campaign_id])
    @investigator = Investigator.find(params[:id])
  end

  def destroy
    @campaign = Campaign.find(params[:campaign_id])
    Investigator.find(params[:id]).destroy
    redirect_to campaign_path(@campaign)
  end

  private

  def investigator_params
    params.require(:investigator).permit(:name, :status, :physical_trauma,
                                         :mental_trauma, :experience_earned,
                                         :unspent_experience)
  end

  def remaining_investigators
    Investigator::POSSIBLE_INVESTIGATORS.values.reject do |name|
      Investigator.all.any? { |investigator| investigator.name == name }
    end
  end
end
