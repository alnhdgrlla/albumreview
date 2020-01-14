class Artist < ApplicationRecord
  has_many :albums
  has_many :songs, through: :albums
  belongs_to :genres
  validates :name, presence: ture, uniqueness: true
end
