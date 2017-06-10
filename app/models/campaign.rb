class Campaign < ApplicationRecord
  has_many :scenarios, dependent: :destroy

  validates :name, presence: true
end
