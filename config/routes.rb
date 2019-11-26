Rails.application.routes.draw do

  resources :attractions, only: [:index, :new, :create, :show]
  # get 'attractions/index'
  # get 'attractions/new'
  # get 'attractions/create'
  resources :sessions, only: [:new, :create, :destroy]
  get '/signin', to: 'sessions#new'
  # post '/signout', to: 'session#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users


  root 'users#index'
end
