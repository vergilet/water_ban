require 'responders'

module WaterBan
  module Api
    class ApplicationController < ActionController::API
      respond_to :json
      before_action :ensure_json_request

      def index
        puts 'here i am'
      end

      def ensure_json_request
        render(nothing: true, status: 406) unless request.format == :json
      end
    end
  end
end
