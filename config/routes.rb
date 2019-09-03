Rails.application.routes.draw do
  resources :restrictions
  resources :measurements
  resources :ingredients
  resources :recipes
  resources :clients
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  # get '/auth/:provider/callback' => 'sessions#create'
  # get '/signin' => 'sessions#new', :as => :signin
  # get '/signout' => 'sessions#destroy', :as => :signout
  # get '/auth/failure' => 'sessions#failure'

  root 'welcome#home'
end
