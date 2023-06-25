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
end
