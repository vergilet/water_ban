class WaterBan::Api::V1::AddressesController < WaterBan::Api::ApplicationController
  before_action :beautify_search_url, only: :index
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @addresses = WaterBan::Addresses::Address.json_results(truncate.present? ? params[:query] : '*')
    render json: @addresses
  end

  def show
    @address = WaterBan::Addresses::Address.custom_find(params[:id])
    respond_with @address.first
  end

  private

  def record_not_found
    render json: {}, status: 404
  end

  def beautify_search_url
    redirect_to search_addresses_path(query: CGI::escape(params[:q])) if params[:q].present?
  end

  def truncate
    x = params[:query].gsub('<wa>обл/., м/.</wa> ', '')
    puts x
    params[:query].sub('<wa>обл/., м/.</wa> ', '')
  end
end
