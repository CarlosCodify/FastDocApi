class Motorcyclist < Person
  has_many :shipments
  has_many :notifications

  belongs_to :person
end
