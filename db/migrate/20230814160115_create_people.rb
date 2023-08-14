class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :surname
      t.string :lastname
      t.string :phone
      t.string :email
      t.string :identity_document

      t.timestamps
    end
  end
end
