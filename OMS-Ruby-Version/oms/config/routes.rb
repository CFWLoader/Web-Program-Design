Rails.application.routes.draw do

  root 'home#index'

  resources :users

  resources :movies

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Movies self-defined routes
  get 'movies_/manage', to: 'movies#manage'

end
