Rails.application.routes.draw do

  root 'users/cds#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_for :owners

  namespace :owners do
    resources :artists, :genres, :labels, :sales
    resources :orders, only: [:index, :show, :edit, :update]
    resources :cds do
       resources :arrivals
    end
    resources :users, only: [:show, :index, :edit, :update]
    resources :creates, only: [:new]
  end

  #devise_scope :admin do
    #get "sign_up", :to => "owners/registrations#new"
  #end

  scope module: :users do
    resources :users, only: [:show, :edit, :destroy] do
  	  resources :deliver_addresses
    end
    resources :cds, only: [:show, :index] do
  	  resources :discs do
    end
  	resources :songs
    end
    resources :orders, only: [:index, :show, :new ,:create]
    get 'unsubscribe' => 'users#unsubscribe'

    resources :user_cds
    resources :cd_orders
  end

  get 'complete' => 'users/orders#complete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end