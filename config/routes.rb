Rails.application.routes.draw do
  resources :restrictions
  resources :measurements
  resources :ingredients
  resources :recipes
  resources :clients
  resources :users
  get 'site/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'site#index'
end
