class Motorcycle < ApplicationRecord
  validates :model, :license_plate, presence: true

  belongs_to :motorcyclist
end
