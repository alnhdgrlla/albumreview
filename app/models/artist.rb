class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :songs, through: :albums, dependent: :destroy
  belongs_to :genre
  belongs_to :user
  validates :name, presence: true
end
