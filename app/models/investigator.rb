class Investigator < ApplicationRecord
  belongs_to :campaign

  enum status: [:ACTIVE, :KILLED, :INSANE]

  after_create :set_defaults

  private

  def set_defaults
    self.status = "ACTIVE"
  end
end
