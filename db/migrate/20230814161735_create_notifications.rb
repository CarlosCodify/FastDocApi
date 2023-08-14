class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :message
      t.datetime :send_date
      t.references :motorcyclist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
