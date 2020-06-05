class Battle < ApplicationRecord
  belongs_to :user
  has_many :team_battle
  has_many :teams, through: :team_battle
end
