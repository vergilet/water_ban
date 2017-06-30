module WaterBan
  module Addresses
    class ApplicationController < ::ApplicationController

      def view(*args)
        render html: cell(*args)
      end
    end
  end
end
