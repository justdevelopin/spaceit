class User < ApplicationRecord
  has_many :spaces
  has_many :reviews
  has_many :bookings
  has_many :bookmarks
end
