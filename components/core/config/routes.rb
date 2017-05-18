WaterBan::Core::Engine.routes.draw do
  root 'home#index'
  get '*path', constraints: lambda {|r| r.subdomain.present? && r.path.present? }, to: 'home#index'
end
