class Location < ApplicationRecord

  acts_as_mappable :default_units => :kms,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  validates :latitude, presence: true, null: false
  validates :longitude, presence: true, null: false

  validates :city, length: { maximum: 120 }
  validates :country, length: { maximum: 120 }

  has_many :users
  has_many :posts

  def Location.find_or_create_new(location)
    Location.find_or_create_by(latitude: location.latitude, longitude: location.longitude)
  end
end
