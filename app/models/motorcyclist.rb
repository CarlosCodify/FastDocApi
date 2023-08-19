class Motorcyclist < ApplicationRecord
  has_many :shipments
  has_many :notifications
  has_many :motorcycles
  belongs_to :person
end
