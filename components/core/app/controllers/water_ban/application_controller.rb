module WaterBan
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    layout false
    def index
      render nothing: true
    end
  end
end
