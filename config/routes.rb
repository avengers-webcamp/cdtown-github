Rails.application.routes.draw do
  devise_for :owners
  devise_for :users
  resources :users do
  	resources :deliver_addresses
  end

  resources :cds do
  	resources :discs do
  end
  		resources :songs
  end
  resources :orders
  resources :owners
  resources :arrivals
  resources :artists
  resources :genres
  resources :labels
  resources :user_cds
  resources :cd_orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
