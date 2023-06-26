require 'rails_helper'

RSpec.describe(Statistic, type: :model) do
  describe 'validations' do
    example 'validates numericality of pass_accuracy' do
      statistic = build(:statistic, pass_accuracy: -1.0)
      refute statistic.valid?

      expected_result = ['must be greater than or equal to 0.0']
      assert_equal expected_result, statistic.errors[:pass_accuracy]
    end

    example 'validates numericality of distance_covered' do
      statistic = build(:statistic, distance_covered: -1)
      refute statistic.valid?

      expected_result = ['must be greater than or equal to 0']
      assert_equal expected_result, statistic.errors[:distance_covered]
    end

    example 'validates numericality of assists' do
      statistic = build(:statistic, assists: -1)
      refute statistic.valid?

      expected_result = ['must be greater than or equal to 0']
      assert_equal expected_result, statistic.errors[:assists]
    end

    example 'validates numericality of goals' do
      statistic = build(:statistic, goals: -1)
      refute statistic.valid?

      expected_result = ['must be greater than or equal to 0']
      assert_equal expected_result, statistic.errors[:goals]
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

        assert_includes Statistic.match_stats(match), statistic1
        assert_includes Statistic.match_stats(match), statistic2
      end
    end

    describe '.player_stats' do
      example 'returns statistics for a specific player' do
        match = create(:match)
        player = create(:player, team: match.home_team)
        statistic = create(:statistic, match: match, player: player)

        assert_equal [statistic], Statistic.player_stats(player)
      end
    end
  end
end
