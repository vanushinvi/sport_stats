require 'rails_helper'

describe Match, type: :model do
  example 'is valid with home_team and away_team' do
    home_team = create(:team)
    away_team = create(:team)
    match = build(:match, home_team: home_team, away_team: away_team)

    assert match.valid?
    assert_equal home_team, match.home_team
    assert_equal away_team, match.away_team
  end

  example 'is invalid without home_team' do
    away_team = create(:team)
    match = build(:match, home_team: nil, away_team: away_team)

    refute match.valid?
  end

  example 'is invalid without away_team' do
    home_team = create(:team)
    match = build(:match, home_team: home_team, away_team: nil)

    refute match.valid?
  end
end
