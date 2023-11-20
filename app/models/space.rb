class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  has_many :bookmarks
end
