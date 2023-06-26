require 'rails_helper'

describe Player, type: :model do
  example 'name is valid' do
    team = build(:team)
    player = build(:player, team: team)

    assert player.valid?
  end

  example 'requires a name' do
    team = build(:team)
    player = FactoryBot.build(:player, team: team, name: nil)

    refute player.valid?
  end

  example 'requires a team' do
    player = FactoryBot.build(:player)

    refute player.valid?
  end

  example 'top_players_by_performance' do
    team = create(:team)
    player1 = create(:player, team: team)
    player2 = create(:player, team: team)
    match = create(:match, home_team: team)
    create(:statistic, match: match, player: player1, goals: 1)
    create(:statistic, match: match, player: player2, goals: 8)

    top_players = Player.top_players_by_performance_in_all_teams('goals')
    expected_result = [player2, player1]
    assert_equal expected_result, top_players
  end

  example '#above_performance_threshold_in_match? - returns true if player meets the performance threshold in the match' do
    team = create(:team)
    player = create(:player, team: team)
    match = create(:match, home_team: team)
    create(:statistic, player: player, goals: 3, match: match)

    above_threshold = player.above_performance_threshold_in_match?('goals', 2, match)
    assert above_threshold
  end

  example '#above_performance_threshold_in_match? - returns false if player does not meet the performance threshold in the match' do
    team = create(:team)
    player = create(:player, team: team)
    match = create(:match, home_team: team)
    create(:statistic, player: player, goals: 1, match: match)

    above_threshold = player.above_performance_threshold_in_match?('goals', 2, match)
    refute above_threshold
  end

  example '#above_performance_threshold_in_last_five_matches?
          - returns true if player meets the performance threshold in at least one of the last five matches' do
    team = create(:team)
    player = create(:player, team: team)
    5.times { create(:match, home_team: team) }
    create(:statistic, player: player, goals: 2, match: Match.first)

    above_threshold = player.above_performance_threshold_in_last_five_matches?('goals', 1)
    assert above_threshold
  end

  example '#above_performance_threshold_in_last_five_matches?
        - returns false if player does not meet the performance threshold in any of the last five matches' do
    team = create(:team)
    player = create(:player, team: team)
    5.times { create(:match, home_team: team) }
    create(:statistic, player: player, goals: 0, match: Match.first)

    above_threshold = player.above_performance_threshold_in_last_five_matches?('goals', 1)
    refute above_threshold
  end
end
