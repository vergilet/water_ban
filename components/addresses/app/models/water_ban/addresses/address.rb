module WaterBan::Addresses
  class Address < ApplicationRecord
    include AddressIndexer
  end
end

# WaterBan::Addresses::Address.__elasticsearch__.client = Elasticsearch::Client.new host: 'http://0.0.0.0:9200'
# WaterBan::Addresses::Address.__elasticsearch__.create_index! force: true
# WaterBan::Addresses::Address.import batch_size: 5000