require 'water_ban/subdomain_constraints'
require 'water_ban/api_constraints'

WaterBan::Core::Engine.routes.draw do
  namespace :api, defaults: { format: :json }, constraints: WaterBan::Api::SubdomainConstraints.new(subdomain: 'api'), path: '/' do
    scope module: :v1, constraints: WaterBan::Api::ApiConstraints.new(version: 1, default: true) do
      get '/', to: 'home#index'
      resources :addresses, constraints: lambda { |_| defined? WaterBan::Addresses }
    end
  end
end
