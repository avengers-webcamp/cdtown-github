Rails.application.routes.draw do
  devise_for :owners
  devise_for :users

  namespace :admin do
    resources :arrivals, :artists, :genres, :labels, :sales
    resources :orders, only: [:index, :show, :edit, :update]
    resources :cds, only: [:new, :show, :index, :edit, :create, :update]
    resources :users, only: [:show, :index, :edit, :update]
  end

  resources :users, only: [:show, :destroy] do
  	resources :deliver_addresses
  end

  resources :cds, only: [:show, :index] do
  	resources :discs do
  end
  		resources :songs
  end
  resources :orders, only: [:new, :complete]
  resources :owners


  resources :user_cds
  resources :cd_orders

  get 'complete' => 'customer/orders#complete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
