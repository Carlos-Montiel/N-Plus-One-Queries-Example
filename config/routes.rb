Rails.application.routes.draw do
  resources :owners
  root to: 'owners#index'
end
