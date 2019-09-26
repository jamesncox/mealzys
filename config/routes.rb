Rails.application.routes.draw do

  #create a nested route

  resources :restrictions
  resources :ingredients
  resources :recipes
  resources :clients
  resources :users

  # resources :clients, only [:show] do
  #   resource :restrictions, only [:index, :create]
  # end

  get '/recipes/search' => 'recipes#search'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')

  root 'welcome#home'
end