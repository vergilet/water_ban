class AddFieldsToAddressModel < ActiveRecord::Migration[5.1]
  def change
    remove_column :water_ban_addresses_addresses, :name
    add_column :water_ban_addresses_addresses, :country, :string
    add_column :water_ban_addresses_addresses, :state, :string
    add_column :water_ban_addresses_addresses, :district, :string
    add_column :water_ban_addresses_addresses, :city, :string
    add_column :water_ban_addresses_addresses, :street_name, :string
    add_column :water_ban_addresses_addresses, :street_number, :string
    add_column :water_ban_addresses_addresses, :index_number, :string
  end
end
