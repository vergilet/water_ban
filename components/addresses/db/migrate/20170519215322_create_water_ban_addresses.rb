class CreateWaterBanAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :water_addresses_addresses, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
