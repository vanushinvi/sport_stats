require 'rails_helper'

RSpec.describe(Statistic, type: :model) do
  describe 'validations' do
    example 'validates numericality of pass_accuracy' do
      statistic = build(:statistic, pass_accuracy: -1.0)
      refute statistic.valid?
      expect(statistic.errors[:pass_accuracy]).to(include('must be greater than or equal to 0.0'))
    end

    example 'validates numericality of distance_covered' do
      statistic = build(:statistic, distance_covered: -1)
      refute statistic.valid?
      expect(statistic.errors[:distance_covered]).to(include('must be greater than or equal to 0'))
    end

    example 'validates numericality of assists' do
      statistic = build(:statistic, assists: -1)
      refute statistic.valid?
      expect(statistic.errors[:assists]).to(include('must be greater than or equal to 0'))
    end

    example 'validates numericality of goals' do
      statistic = build(:statistic, goals: -1)
      refute statistic.valid?
      expect(statistic.errors[:goals]).to(include('must be greater than or equal to 0'))
    end
  end

  describe 'scopes' do
    describe '.match_stats' do
      example 'returns statistics for a specific match' do
        match = create(:match)
        player1 = create(:player, team: match.home_team)
        player2 = create(:player, team: match.home_team)
        statistic1 = create(:statistic, match: match, player: player1)
        statistic2 = create(:statistic, match: match, player: player2)

        expect(Statistic.match_stats(match)).to(include(statistic1, statistic2))
      end
    end

    describe '.player_stats' do
      example 'returns statistics for a specific player' do
        match = create(:match)
        player = create(:player, team: match.home_team)
        statistic = create(:statistic, match: match, player: player)
        expect(Statistic.player_stats(player)).to(eq([statistic]))
      end
    end
  end
end
