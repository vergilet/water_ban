module Address
  module Cell
    class Index < ApplicationCell
      include Webpacker::Helper
      include React::Rails::ViewHelper

      private

      def some_show(address)
        address.id
      end
    end
  end
end
