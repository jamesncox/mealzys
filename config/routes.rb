Rails.application.routes.draw do
  resources :restrictions
  resources :ingredients
  resources :recipes
  resources :clients
  resources :users

  get '/search' => 'recipes#search'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get '/auth/google_oauth2', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')

  root 'welcome#home'
end