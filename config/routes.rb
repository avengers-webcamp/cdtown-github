Rails.application.routes.draw do

  root 'users/cds#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_for :owners

  namespace :owners do
    resources :artists, :genres, :labels, :sales
    resources :orders, only: [:index, :show, :edit, :update, :destroy]
    resources :cds do
       resources :arrivals
    end
    resources :users, only: [:show, :index, :edit, :update ,:destroy]
    resources :creates, only: [:new]
  end

  #devise_scope :admin do
    #get "sign_up", :to => "owners/registrations#new"
  #end

  scope module: :users do
    resources :users, only: [:show, :edit, :update, :destroy] do
  	  resources :deliver_addresses
      resources :orders, only: [:index, :show, :new ,:create ,:destroy]
      get 'complete' => 'orders#complete'
    end
    resources :cds, only: [:show, :index] do
  	  resources :discs do
    end
  	resources :songs
    end
    get '/unsubscribe/:id' => 'users#unsubscribe'
    get "search" => "cds#search"
    get 'genre/:id' => 'cds#genre'
    post   '/like/:cd_id' => 'likes#like',   as: 'like'
    delete '/like/:cd_id' => 'likes#unlike', as: 'unlike'


    resources :user_cds
    resources :cd_orders, only: [:create]

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end