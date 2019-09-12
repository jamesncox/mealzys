Rails.application.routes.draw do
  resources :restrictions
  resources :ingredients
  resources :recipes
  resources :clients

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  root 'welcome#home'
end