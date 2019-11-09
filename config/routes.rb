Rails.application.routes.draw do

  get 'rides/create'
  get 'static/home'
  root 'static#home'

  get '/signin' => 'sessions#new'

  post '/session' => 'sessions#create'
  delete '/session' => 'sessions#destroy'

  resources :users
  resources :attractions
  resources :rides, only: :create
end
