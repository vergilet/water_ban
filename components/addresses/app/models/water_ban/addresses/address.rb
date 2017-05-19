module WaterBan::Addresses
  class Address < ApplicationRecord
    default_scope -> { order(created_at: :asc) }
    validates :name, presence: true
  end
end