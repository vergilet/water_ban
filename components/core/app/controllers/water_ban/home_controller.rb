module WaterBan
  class HomeController < ApplicationController
    SUBDOMAINS = %w(api)
    before_action :redirect_from_subdomain

    def index
      render plain: 'welcome home'
    end

    private

    def redirect_from_subdomain
      redirect_to root_url(host: request.domain) if SUBDOMAINS.include?(request.subdomain)
    end
  end
end
