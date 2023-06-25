class Player < ApplicationRecord
  belongs_to :team
  has_many :statistics
  has_many :matches, through: :statistics

  validates :name, presence: true
end
