class AddNotesToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :notes, :string
  end
end
