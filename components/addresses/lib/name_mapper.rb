class NameMapper
  def initialize(hashes)
    @hashes = hashes
  end

  def mapped_results
    json_hashes = JSON.parse(hashes.to_json)
    format_map(json_hashes)
  end

  private

  attr_reader :hashes

  def format_map(hashes)
    hashes.map do |h|
      source_hash = h.kind_of?(Array) ? h[0] : h
      hash = source_hash["_source"]
      hash['name'] = "#{hash['state']} #{hash['city']}, #{hash['street_name']} #{hash['street_number']}"
      hash
    end
  end
end
