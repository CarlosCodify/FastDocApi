class ShipmentStatus < ApplicationRecord
  validates :description, presence: true, uniqueness: true

  has_many :shipments
end
