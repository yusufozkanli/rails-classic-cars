Rails.application.routes.draw do

  get '/cars/map', to: 'cars#map'
  get '/cars/search', to: 'cars#search'
  resources :cars do
    resources :rentals, only: [ :new, :create ]
  end

  devise_for :users
  resources :users, only: [ :show ]

  root to: 'cars#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
