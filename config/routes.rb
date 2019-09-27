Rails.application.routes.draw do
  
  resources :ingredients
  resources :recipes
  resources :clients
  resources :users

  resources :clients, only: [:show] do
    resources :restrictions, only: [:show, :index, :new, :create]
  end

  get '/recipes/search' => 'recipes#search'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')

  root 'welcome#home'
end
