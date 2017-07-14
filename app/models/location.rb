class Location < ApplicationRecord

  validates :latitude, presence: true, null: false
  validates :longitude, presence: true, null: false

  validates :city, length: { maximum: 120 }
  validates :country, length: { maximum: 120 }

  has_many :users
  has_many :posts
end
