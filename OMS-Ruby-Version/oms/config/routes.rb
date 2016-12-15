Rails.application.routes.draw do
  get 'movie/index'

  #get 'user/index'

  #get 'home/index'
  get 'user/test_resource'

  root 'home#index'

  resources :user

  resources :movie

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
