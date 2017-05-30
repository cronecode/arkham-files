require 'rails_helper'

RSpec.describe "View existing campaign" do
  it "redirects to the appropriate campaign page" do
    Campaign.create(name: "Zealot")
    Campaign.create(name: "Dunwich")

    visit campaigns_path
    click_link "Dunwich"

    expect(page).to have_current_path("/campaigns/1")
  end
end