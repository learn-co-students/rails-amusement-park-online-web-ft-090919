Rails.application.routes.draw do
  resources :attractions

  resources :users
  resources :sessions

  root 'application#index'

  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  get '/logout', to: 'sessions#destroy'
  post '/rides/:attraction_id', to: 'rides#create'
 
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
