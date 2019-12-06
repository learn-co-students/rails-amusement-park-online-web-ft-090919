Rails.application.routes.draw do
  get 'rides/create'
  get 'rides/ride_params'
  get 'attractions/new'
  get 'attractions/create'
  get 'attractions/edit'
  get 'attractions/update'
  get 'attractions/show'
  get 'attractions/index'
  get 'attractions/attraction_params'
  resources :users, only: [:new, :create, :show]
  root to: 'users#new'
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :attractions, only: [:new, :create, :edit, :update, :index, :show]
  resources :rides, only: [:create]
end