require 'rails_helper'

RSpec.describe "Add a new campaign" do
  it "button redirects to campaigns/new" do
    visit root_path
    click_link "Add new campaign"
    
    expect(page).to have_current_path("/campaigns/new")
  end
end