class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.datetime :request_date
      t.datetime :delivery_date
      t.references :motorcyclist, null: false, foreign_key: true
      t.references :document, null: false, foreign_key: true
      t.references :sender_customer, null: false, foreign_key: { to_table: :customers }
      t.references :receiver_customer, null: false, foreign_key: { to_table: :customers }
      t.references :shipment_status, null: false, foreign_key: true
      t.references :pickup_location, foreign_key: { to_table: :locations }
      t.references :delivery_location, foreign_key: { to_table: :locations }

      t.timestamps
    end
  end
end
