Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :users
  resources :sessions, except: [:new, :destroy]
  get 'signin', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  resources :attractions
  resources :rides, only: [:create]
end
