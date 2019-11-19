Rails.application.routes.draw do

  get 'users/new', to: 'users#new', as: 'new_user'
  root 'static#home'

  # user model routes
  get '/users', to: 'users#index', as: 'users'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'

  # sessions / user log routes
  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
  delete '/session/', to: 'session#destroy'

  # attractions model routes
  get '/attractions', to: 'attractions#index', as: 'attractions'
  get 'attractions/new', to: 'attractions#new', as: 'new_attraction'
  get '/attractions/:id', to: 'attractions#show', as: 'attraction'
  get '/attractions/:id/edit', to: 'attractions#edit', as: 'edit_attraction'
  patch '/attractions/:id', to: 'attractions#update'
  post '/attractions', to: 'attractions#create'

  # ride module routes
  post '/rides', to: 'rides#create', as: 'rides'
end
