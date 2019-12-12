Rails.application.routes.draw do

  root 'users/cds#index'

  devise_for :users

  devise_for :owners

  namespace :owners do
    root 'owners/cds#index'
    resources :arrivals, :artists, :genres, :labels, :sales
    resources :orders, only: [:index, :show, :edit, :update]
    resources :cds, only: [:new, :show, :index, :edit, :create, :update]
    resources :users, only: [:show, :index, :edit, :update]
  end

  #devise_scope :admin do
    #get "sign_up", :to => "owners/registrations#new"
  #end

  scope module: :users do
    resources :users, only: [:show, :destroy] do
  	  resources :deliver_addresses
    end
    resources :cds, only: [:show, :index] do
  	  resources :discs do
    end
  	resources :songs
    end
    resources :orders, only: [:new]
  end

  resources :user_cds
  resources :cd_orders

  get 'complete' => 'users/orders#complete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end