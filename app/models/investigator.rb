class Investigator < ApplicationRecord
  belongs_to :campaign

  enum status: [:ACTIVE, :KILLED, :INSANE]

  after_create :set_defaults

  private

  def set_defaults
    self.status = "ACTIVE"
    self.physical_trauma = 0
    self.mental_trauma = 0
  end
end
