Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :users
    resources :admin
    resources :attractions
    # resources :rides 

    get '/signin', to: 'sessions#new'
    post '/signin', to: 'sessions#create'
    delete '/sessions', to: 'sessions#destroy'

    root to: 'static#home'
    post '/rides', to: 'rides#create'


end

