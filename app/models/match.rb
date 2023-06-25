class Match < ApplicationRecord
  has_many :statistics
  has_many :players, through: :statistics
  has_many :teams
end
