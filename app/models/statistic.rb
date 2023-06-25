class Statistic < ApplicationRecord
  belongs_to :player
  belongs_to :match

  validates :pass_accuracy, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 100.0 }
  validates :distance_covered, :assists, :goals, numericality: { greater_than_or_equal_to: 0 }

  scope :match_stats, ->(match) { where(match: match) }
  scope :player_stats, ->(player) { where(player: player) }
end
