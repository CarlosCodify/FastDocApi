class Location < ApplicationRecord
  validates :latitude, :longitude, :description, presence: true

  belongs_to :customer
end
