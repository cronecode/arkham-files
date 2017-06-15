class Investigator < ApplicationRecord
  belongs_to :campaign

  POSSIBLE_INVESTIGATORS = {
      DAISY_WALKER: 'Daisy Walker',
      REX_MURPHY: 'Rex Murphy',
      AGNES_BAKER: 'Agnes Baker'
  }

  enum status: [:ACTIVE, :KILLED, :INSANE]

  ACTIVE = 'ACTIVE'
  KILLED = 'KILLED'
  INSANE = 'INSANE'

  validates :name, presence: true, uniqueness: true
  validates :physical_trauma, numericality: { greater_than_or_equal_to: 0 }
  validates :mental_trauma, numericality: { greater_than_or_equal_to: 0 }
  validates :experience_earned, numericality: { greater_than_or_equal_to: 0 }
  validates :unspent_experience, numericality: { greater_than_or_equal_to: 0 }
end
