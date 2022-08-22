class Team < ApplicationRecord
  validates :team_name, presence: true, uniqueness: true
  has_many :join_teams, dependent: :destroy
  has_many :join_team_users, through: :join_teams, source: :user
  belongs_to :user
end
