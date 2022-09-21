Rails.application.routes.draw do
  devise_for :users
  resources :orders
  resources :customers

  root "orders#index"
end
