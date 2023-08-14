class Shipment < ApplicationRecord
  validates :request_date, :document, :sender_customer, :receiver_customer, :shipment_status, presence: true

  belongs_to :motorcyclist, optional: true
  belongs_to :document
  belongs_to :sender_customer, class_name: 'Customer'
  belongs_to :receiver_customer, class_name: 'Customer'
  belongs_to :shipment_status
  belongs_to :pickup_location, class_name: 'Location', optional: true
  belongs_to :delivery_location, class_name: 'Location', optional: true  
end
