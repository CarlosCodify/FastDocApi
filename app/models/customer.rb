class Customer < ApplicationRecord
  has_many :locations
  has_many :sent_shipments, class_name: 'Shipment', foreign_key: 'sender_customer_id'
  has_many :received_shipments, class_name: 'Shipment', foreign_key: 'receiver_customer_id'
  has_many :payments, as: :payer
  belongs_to :person
end
