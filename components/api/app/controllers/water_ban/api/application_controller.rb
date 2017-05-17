module WaterBan
  module Api
    class ApplicationController < WaterBan::ApplicationController
      def index
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
