class WaterBan::Api::V1::HomeController < WaterBan::Api::ApplicationController

  def index
    render plain: 'welcome api'
  end

  private

  respond_to :html

  def ensure_json_request
    return
  end
end
