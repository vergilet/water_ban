class WaterBan::Api::V1::AddressesController < WaterBan::Api::ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @addresses = WaterBan::Addresses::Address.all.reverse
    respond_with @addresses
  end

  def show
    @address = WaterBan::Addresses::Address.find(params[:id])
    respond_with @address
  end

  private

  def record_not_found
    render json: {}, status: 404
  end
end
