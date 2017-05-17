module WaterBan
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    def index
      render nothing: true
    end
  end
end
