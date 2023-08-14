class CreateMotorocycles < ActiveRecord::Migration[7.0]
  def change
    create_table :motorocycles do |t|
      t.string :model
      t.string :license_plate
      t.boolean :active
      t.references :motorcyclist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
