class Artist < ApplicationRecord
  has_many :albums
  has_many :songs, through: :album
  belongs_to :genre
  belongs_to :user
  validates :name, presence: ture, uniqueness: true
end
