class Team < ApplicationRecord
  has_many :home_matches, class_name: 'Match', foreign_key: 'home_team_id', dependent: :destroy
  has_many :away_matches, class_name: 'Match', foreign_key: 'away_team_id', dependent: :destroy
  has_many :players, dependent: :destroy

  validates :name, presence: true

  def top_players_by_performance(performance)
    players.joins(:statistics)
      .group(:id)
      .order("MAX(statistics.#{performance}) DESC")
      .limit(5)
  end
end
