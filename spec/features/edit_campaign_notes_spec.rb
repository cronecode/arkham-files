require 'rails_helper'

RSpec.describe "Edit campaign notes" do
  it "edits an existing campaign's notes" do
    @campaign = FactoryGirl.create(:campaign)

    visit edit_campaign_path(@campaign)

    expect(page).to have_content(@campaign[:notes])
  end
end