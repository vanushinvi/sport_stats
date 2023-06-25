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
end
