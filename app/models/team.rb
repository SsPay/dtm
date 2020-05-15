class Team < ApplicationRecord
  has_many :team_user
  has_many :user, through: :team_user
end
