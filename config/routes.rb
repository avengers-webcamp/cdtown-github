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
    resources :users, only: [:show, :edit, :update, :destroy] do
  	  resources :deliver_addresses
      resources :orders, only: [:index, :show, :new ,:create]
      get 'complete' => 'orders#complete'
    end
    resources :cds, only: [:show, :index] do
  	  resources :discs do
    end
  	resources :songs
    end
    get '/unsubscribe/:id' => 'users#unsubscribe'

    resources :user_cds
    resources :cd_orders
    resources :cd_orders
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end