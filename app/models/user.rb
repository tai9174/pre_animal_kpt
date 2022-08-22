class User < ApplicationRecord
  has_many :owned_teams, class_name: "Team"
  has_many :join_teams, dependent: :destroy
  has_many :join_team_teams, through: :join_teams, source: :team
  has_many :teams, dependent: :destroy
  has_many :kpts
  validates :name, presence: true, uniqueness: true, length: {minimum:3, maximum: 20}
  validates :password, presence: true, length: { minimum: 6 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable
end
