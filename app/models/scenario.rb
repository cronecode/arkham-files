class Scenario < ApplicationRecord
  belongs_to :campaign

  validates :name, presence: true
  validates :campaign_id, presence: true
end
