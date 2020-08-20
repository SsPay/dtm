class Team < ApplicationRecord
  mount_uploader :logo, TeamLogoUploader
  has_many :team_user
  has_many :team_battle
  has_many :users, through: :team_user
  has_many :battles, through: :team_battle

  scope :best, -> { order('rating DESC') }
end
