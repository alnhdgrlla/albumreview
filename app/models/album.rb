class Album < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :songs, dependent: :destroy
  belongs_to :user
  belongs_to :genre
end
