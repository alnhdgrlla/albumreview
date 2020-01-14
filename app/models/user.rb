class User < ApplicationRecord
  has_many :artists
  has_many :albums
  has_many :songs
  has_many :reviews
end
