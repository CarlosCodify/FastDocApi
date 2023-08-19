class RenameMotorocycleToMotorcycle < ActiveRecord::Migration[7.0]
  def change
    rename_table :motorocycles, :motorcycles
  end
end
