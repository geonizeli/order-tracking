Rails.application.routes.draw do
  resources :orders
  resources :customers

  root "orders#index"
end
