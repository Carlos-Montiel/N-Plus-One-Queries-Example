Rails.application.routes.draw do
  resources :restaurants
  resources :owners
  root to: 'restaurants#index'
end
