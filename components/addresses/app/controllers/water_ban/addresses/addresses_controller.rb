module WaterBan::Addresses
  class AddressesController < ApplicationController

    def index
      render plain: 'html addresses'
    end

    def new
      @address = Address.new
    end
  end
end