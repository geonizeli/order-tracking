Rails.application.routes.draw do
  devise_for :users
  resources :tracking

  get 'admin' => 'orders#index'
  scope :admin do
    resources :orders
    resources :customers
  end

  root "tracking#index"
end
