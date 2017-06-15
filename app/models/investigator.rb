class Investigator < ApplicationRecord
  belongs_to :campaign

  enum status: [:ACTIVE, :KILLED, :INSANE]

  validates :name, presence: true, uniqueness: true
  validates :physical_trauma, numericality: { greater_than_or_equal_to: 0 }
  validates :mental_trauma, numericality: { greater_than_or_equal_to: 0 }
  validates :experience_earned, numericality: { greater_than_or_equal_to: 0 }
end
