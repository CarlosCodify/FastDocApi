class Shipment < ApplicationRecord
  belongs_to :motorcyclist
  belongs_to :document
  belongs_to :sender_customer
  belongs_to :receiver_customer
  belongs_to :shipment_status
end
