class Scenario < ApplicationRecord
  belongs_to :campaign

  validates :name, presence: true
  validates :campaign_id, presence: true
  validates :notes, length: { minimum: 1 }, if: :notes_present?

  before_validation do
    self.notes = self.notes.strip if notes_present?
  end

  def notes_present?
    !notes.nil?
  end
end
