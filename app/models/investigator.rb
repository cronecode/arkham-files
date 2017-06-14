class Investigator < ApplicationRecord
  belongs_to :campaign

  enum status: [:ACTIVE, :KILLED, :INSANE]

  validates :name, presence: true, uniqueness: true
  validates :status, presence: true
end
