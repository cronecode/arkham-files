class Investigator < ApplicationRecord
  belongs_to :campaign

  enum status: [:ACTIVE, :KILLED, :INSANE]
end
