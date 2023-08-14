class ChangeMotorcyclistIdInShipments < ActiveRecord::Migration[7.0]
  def change
    change_column :shipments, :motorcyclist_id, :bigint, null: true
  end
end
