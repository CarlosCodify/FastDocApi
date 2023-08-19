class Location < ApplicationRecord
  validates :latitude, :longitude, :description, presence: true

  belongs_to :customer, optional: true
end
