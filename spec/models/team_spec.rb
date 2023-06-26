require 'rails_helper'

describe Team, type: :model do
  example 'is valid with a name' do
    team = build(:team, name: 'Example Team')

    assert team.valid?
  end

  example 'is invalid without a name' do
    team = build(:team, name: nil)

    refute team.valid?
  end

  example 'returns top players by performance' do
    team = create(:team, name: 'Team 1')
    player1 = create(:player, name: 'Player 1', team: team)
    player2 = create(:player, name: 'Player 2', team: team)
    match = create(:match, home_team: team)
    create(:statistic, match: match, player: player1, goals: 5)
    create(:statistic, match: match, player: player2, goals: 3)

    top_players = team.top_players_by_performance('goals')

    assert_includes top_players, player1
    assert_includes top_players, player2
  end

  example 'returns an empty array when there are no statistics for players' do
    team = Team.create(name: 'Team 1')
    Player.create(name: 'Player 1', team: team)
    Player.create(name: 'Player 2', team: team)
    away_team = create(:team)
    create(:match, home_team: team, away_team: away_team)

    top_players = team.top_players_by_performance('goals')

    assert_equal [], top_players
  end
end
