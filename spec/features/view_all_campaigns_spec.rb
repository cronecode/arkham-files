require 'rails_helper'

RSpec.describe "View all campaigns" do
  it "button redirects to /campaigns" do
    visit root_path
    click_link "View my campaigns"

    expect(page).to have_current_path("/campaigns")
  end

  it "displays the list of created campaigns" do
    Campaign.create(name: "Zealot")
    Campaign.create(name: "Dunwich")

    visit campaigns_path

    expect(page).to have_link("Zealot")
    expect(page).to have_link("Dunwich")
  end
end