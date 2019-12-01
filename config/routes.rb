Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :rides, only: [:show]

  post '/users/:id', to: 'users#ride'
  get '/signin', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  root 'sessions#new'

end
