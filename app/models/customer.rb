class Customer < Person
  has_many :locations
  has_many :sent_shipments, class_name: 'Shipment', foreign_key: 'sender_customer_id'
  has_many :received_shipments, class_name: 'Shipment', foreign_key: 'receiver_customer_id'

  belongs_to :person
end
