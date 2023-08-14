class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :latitude
      t.string :longitude
      t.string :description
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
