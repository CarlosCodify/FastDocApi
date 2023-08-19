class NullTrueToCustomerInLocations < ActiveRecord::Migration[7.0]
  def change
    change_column_null :locations, :customer_id, true
  end
end
