Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WaterBan::Core::Engine => '/', as: 'water_ban'
end
