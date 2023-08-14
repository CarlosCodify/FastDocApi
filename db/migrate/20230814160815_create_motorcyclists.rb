class CreateMotorcyclists < ActiveRecord::Migration[7.0]
  def change
    create_table :motorcyclists do |t|
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
