Rails.application.routes.draw do
  get 'sessions/home'
  root 'sessions#index'

  get '/signin' => 'sessions#new'

  post '/session' => 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
end
