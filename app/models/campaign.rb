class Campaign < ApplicationRecord
  has_many :scenarios, dependent: :destroy
  has_many :investigators, dependent: :destroy

  validates :name, presence: true
end
