class Scenario < ApplicationRecord
  belongs_to :campaign

  enum resolution: [:no_resolution, :R1, :R2, :R3]

  validates :name, presence: true
  validates :campaign_id, presence: true
  validates :notes, length: { minimum: 1 }, if: :notes_present?
  validates :victory_display, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, if: :victory_display_present?

  before_validation do
    self.notes = self.notes.strip if notes_present?
  end

  def notes_present?
    !notes.nil?
  end

  def victory_display_present?
    !victory_display.nil?
  end
end
