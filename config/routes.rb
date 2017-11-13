Rails.application.routes.draw do

  resources :cars, only: [ :index, :add, :show ]

  devise_for :users

  root to: 'cars#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
