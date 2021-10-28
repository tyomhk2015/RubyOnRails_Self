Rails.application.routes.draw do
  devise_for :users
  # This has all the routes related to 'services', made by scaffold.
  # Instead of visiting 'SHOW SERVICE', utilizing 'rails routes' command will make the POST much easier.
  resources :services

  get 'home/index'
  get 'home/about'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end