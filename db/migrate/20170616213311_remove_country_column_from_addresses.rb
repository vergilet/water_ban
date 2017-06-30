class RemoveCountryColumnFromAddresses < ActiveRecord::Migration[5.1]
  def change
    remove_column :water_ban_addresses_addresses, :country
  end
end
