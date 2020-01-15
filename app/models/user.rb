class User < ApplicationRecord
  has_many :artists, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :songs, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
