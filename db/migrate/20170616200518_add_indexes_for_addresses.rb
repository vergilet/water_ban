class AddIndexesForAddresses < ActiveRecord::Migration[5.1]
  def change
    add_index :water_ban_addresses_addresses, :country
    add_index :water_ban_addresses_addresses, :state
    add_index :water_ban_addresses_addresses, :district
    add_index :water_ban_addresses_addresses, :city
    add_index :water_ban_addresses_addresses, :street_name
    add_index :water_ban_addresses_addresses, :street_number
    add_index :water_ban_addresses_addresses, :index_number
  end
end
