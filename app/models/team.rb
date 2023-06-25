class Team < ApplicationRecord
  has_many :players
  has_many :matches

  validates :name, presence: true
end
