class Space < ApplicationRecord


  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  
  belongs_to :user
  has_many :bookings
  has_many :reviews
  has_many :bookmarks
end
