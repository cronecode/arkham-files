class Campaign < ApplicationRecord
  has_many :scenarios

  validates :name, presence: true
end
