Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'welcome#index'

  get  '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  post '/rides' => 'rides#create'

  
  resources :users
  resources :attractions
  resources :rides, only: [:create]
  
  
end
