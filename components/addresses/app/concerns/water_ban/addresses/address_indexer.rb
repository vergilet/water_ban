require 'name_mapper'

module WaterBan::Addresses
  module AddressIndexer
    extend ActiveSupport::Concern

    included do
      include Elasticsearch::Model

      index_name Rails.application.class.parent_name.underscore + '_addresses_addresses'
      document_type self.name.downcase

      settings index: { number_of_shards: 4 } do
        mapping do
          indexes :id, type: 'keyword', index: :not_analyzed
          indexes :state, analyzer: 'ukrainian'
          indexes :district, analyzer: 'ukrainian'
          indexes :city, analyzer: 'ukrainian'
          indexes :street_name, analyzer: 'ukrainian'
          indexes :street_number, analyzer: 'ukrainian'
          indexes :index_number, type: 'integer'
        end
      end

      def as_indexed_json(options={})
        as_json(
          root: false,
          only: [:id, :state, :district, :city, :street_name, :street_number, :index_number]
        )
      end
    end

    class_methods do

      def json_results(query = '*')
        results = custom_search(query).results
        ::NameMapper.new(results).mapped_results
      end

      def custom_find(id)
        results = __elasticsearch__.search(query: match_id(id)).results
        ::NameMapper.new(results).mapped_results
      end

      def custom_search(query)
        __elasticsearch__.search(query: multi_match_query(query))
      end

      def match_id(id)
        {
          match: {
            id: "#{id}"
          }
        }
      end

      def multi_match_query(query)
        {
          multi_match: {
            query: "#{query}",
            type: "cross_fields",
            fields: ["state", "district", "city", "street_name", "street_number"],
            # operator: "and"

            # boost:         1.0,
            # fuzziness:     2,
            # prefix_length: 0,
            # max_expansions: 100
          }
        }
      end
    end
  end
end

# curl -XPUT 'http://127.0.0.1:9200/water_ban_addresses_addresses/?pretty=1'  -d '
# {
#    "mappings" : {
#       "waterban::addresses::address" : {
#          "properties" : {
#             "city" : {
#                "fields" : {
#                   "city" : {
#                      "type" : "string",
#                      "analyzer" : "left"
#                   },
#                   "district" : {
#                      "type" : "string",
#                      "analyzer" : "right"
#                   }
#                },
#                "type" : "multi_field"
#             }
#          }
#
#       }
#    },
#    "settings" : {
#       "analysis" : {
#          "analyzer" : {
#             "left" : {
#                "filter" : [
#                   "standard",
#                   "lowercase",
#                   "stop"
#                ],
#                "type" : "custom",
#                "tokenizer" : "left_tokenizer"
#             },
#             "right" : {
#                "filter" : [
#                   "standard",
#                   "lowercase",
#                   "stop"
#                ],
#                "type" : "custom",
#                "tokenizer" : "right_tokenizer"
#             }
#          },
#          "tokenizer" : {
#             "left_tokenizer" : {
#                "side" : "front",
#                "max_gram" : 20,
#                "type" : "edgeNGram"
#             },
#             "right_tokenizer" : {
#                "side" : "back",
#                "max_gram" : 20,
#                "type" : "edgeNGram"
#             }
#          }
#       }
#    }
# }
# '
#
#
#
# curl -XGET 'http://127.0.0.1:9200/water_ban_addresses_addresses/_search?pretty=1'  -d '
# {
#    "query" : {
#       "multi_match" : {
#          "fields" : "state", "district", "city", "street_name", "street_number",
#          "query" : "Льв Вол"
#       }
#    }
# }
# '
#
#
# curl -XPUT 'http://127.0.0.1:9200/water_ban_addresses_addresses?pretty=1'  -d '
# {
#   "settings": {
#     "analysis": {
#       "analyzer": {
#         "autocomplete": {
#           "tokenizer": "autocomplete",
#           "filter": [
#             "lowercase"
#           ]
#         },
#         "autocomplete_search": {
#           "tokenizer": "lowercase"
#         }
#       },
#       "tokenizer": {
#         "autocomplete": {
#           "type": "edge_ngram",
#           "min_gram": 2,
#           "max_gram": 10,
#           "token_chars": [
#             "letter"
#           ]
#         }
#       }
#     }
#   },
#   "mappings": {
#     "waterban::addresses::address": {
#       "properties": {
#           "city": {
#             "type": "text",
#             "analyzer": "autocomplete",
#             "search_analyzer": "autocomplete_search"
#           },
#           "street": {
#             "type": "text",
#             "analyzer": "autocomplete",
#             "search_analyzer": "autocomplete_search"
#           },
#           "number": {
#             "type": "text",
#             "analyzer": "autocomplete",
#             "search_analyzer": "autocomplete_search"
#           }
#       }
#     }
#   }
# }
# '
#
#
# curl -XPUT 'http://127.0.0.1:9200/water_ban_addresses_addresses/waterban::addresses::address/1?pretty=1' -d '
# {
#   "city": "Львів",
#   "street": "вул. Володимира Великого",
#   "number": "31"
# }
# '
#
# curl -XPUT 'http://127.0.0.1:9200/_search' -d '
# {
#   "query": {
#     "match": {
#       "city": {
#         "query": "Льв Вол",
#         "operator": "and"
#       }
#     }
#   }
# }
# '
# multi_match: {
#   query: "#{query}",
#   type: "cross_fields",
#   fields: ["state", "district", "city", "street_name", "street_number"],