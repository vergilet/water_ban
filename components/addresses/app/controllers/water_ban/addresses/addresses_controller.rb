module WaterBan::Addresses
  class AddressesController < WaterBan::Addresses::ApplicationController

    def index
      view ::Address::Cell::Index, addresses
    end

    private

    def address
      @address ||= WaterBan::Addresses::Address.find(params[:id])
    end

    def addresses
      @addresses ||= WaterBan::Addresses::Address.last(5)
    end

    def address_params
      params.require(:address).permit(:name)
    end
  end
end
