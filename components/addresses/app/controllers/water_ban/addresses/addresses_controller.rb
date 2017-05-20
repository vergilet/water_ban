module WaterBan::Addresses
  class AddressesController < ApplicationController

    helper_method :address, :addresses

    def index
      render :index
    end

    def new
      @address = Address.new
    end

    def create
      @address = Address.new(address_params)

      if @address.save
        redirect_to [water_ban, @address], notice: 'Address was successfully created.'
      else
        render :new
      end
    end

    def update
      if address.update(address_params)
        redirect_to [water_ban, @address], notice: 'Address was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      address.destroy
      redirect_to water_ban.addresses_url, notice: 'Address was successfully destroyed.'
    end

    private

    def address
      @address ||= Address.find(params[:id])
    end

    def addresses
      @addresses ||= Address.all
    end

    def address_params
      params.require(:address).permit(:name)
    end
  end
end
