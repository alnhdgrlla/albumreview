class Artist < ApplicationRecord
  has_many :albums
  has_many :songs, through: :albums
  belongs_to :genres
  belongs_to :users
  validates :name, presence: ture, uniqueness: true
end
