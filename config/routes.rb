Rails.application.routes.draw do

  root 'welcome#home'
  get 'welcome/home'
  resources :attractions, only: [:index, :new, :create, :show, :edit, :update]
  resources :rides, only: [:create]
  resources :sessions, only: [:new, :create, :destroy]
  get '/signin', to: 'sessions#new'
  resources :users

end
