class Investigator < ApplicationRecord
  belongs_to :campaign

  enum status: [:active, :killed, :insane]
end
