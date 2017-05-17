module WaterBan
  module Api
    class ApplicationController < ActionController::API

      def index
        puts 'xxx'
        puts 'xxx'
        puts 'xxx'
        puts 'xxx'
        puts 'xxx'
        puts 'xxx'
        puts 'xxx'
        puts 'xxx'
        puts 'xxx'
        puts 'xxx'
        render nothing: true
      end
      # respond_to :json
      #
      # before_action :ensure_json_request
      #
      # def ensure_json_request
      #   return if request.format == :json
      #   render :nothing => true, :status => 404
      # end
    end
  end
end
