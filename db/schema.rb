# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170616213311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"
  enable_extension "uuid-ossp"

  create_table "water_ban_addresses_addresses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.string "district"
    t.string "city"
    t.string "street_name"
    t.string "street_number"
    t.string "index_number"
    t.index ["city"], name: "index_water_ban_addresses_addresses_on_city"
    t.index ["district"], name: "index_water_ban_addresses_addresses_on_district"
    t.index ["index_number"], name: "index_water_ban_addresses_addresses_on_index_number"
    t.index ["state"], name: "index_water_ban_addresses_addresses_on_state"
    t.index ["street_name"], name: "index_water_ban_addresses_addresses_on_street_name"
    t.index ["street_number"], name: "index_water_ban_addresses_addresses_on_street_number"
  end

end
