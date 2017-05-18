require 'water_ban/addresses/empty_subdomain_constraints'

WaterBan::Core::Engine.routes.draw do
  scope module: 'addresses' do
    resources :addresses, constraints: WaterBan::Addresses::EmptySubdomainConstraints.new
  end
end