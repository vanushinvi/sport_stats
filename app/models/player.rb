class Player < ApplicationRecord
  belongs_to :team
  has_many :statistics
  has_many :matches, through: :statistics

  validates :name, presence: true

  def self.top_players_by_performance(performance)
    joins(:statistics)
      .group(:id)
      .order("MAX(statistics.#{performance}) DESC")
      .limit(5)
  end

  def above_performance_threshold_in_match?(performance, threshold, match)
    statistics.where("#{performance} >= ?", threshold).where(match: match).exists?
  end

  def above_performance_threshold_in_last_five_matches?(performance, threshold)
    last_5_matches = team.matches.order(date: :desc).limit(5)
    statistics.where("#{performance} > ?", threshold).where(match: last_5_matches).exists?
  end
end
