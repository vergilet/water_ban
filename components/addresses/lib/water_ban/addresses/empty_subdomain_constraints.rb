module WaterBan
  module Addresses
    class EmptySubdomainConstraints

      # def initialize(options)
      #   @subdomain = options[:subdomain]
      # end

      def matches?(req)
        req.subdomains.blank? || req.subdomain == 'www'
      end
    end
  end
end
