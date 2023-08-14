class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.datetime :payment_date
      t.string :payer_type
      t.bigint :payer_id
      t.references :shipment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
