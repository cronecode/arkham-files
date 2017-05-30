require 'rails_helper'

RSpec.describe "View all campaigns" do
  it "button redirects to /campaigns" do
    visit root_path
    click_link "View my campaigns"

    expect(page).to have_current_path("/campaigns")
  end
end