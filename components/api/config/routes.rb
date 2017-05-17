WaterBan::Core::Engine.routes.draw do
  namespace :api, defaults: { format: [:json, :html] }, path: '/api' do
    scope module: :v1 do
      resources :addresses
    end
  end

end