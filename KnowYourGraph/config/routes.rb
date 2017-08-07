Rails.application.routes.draw do

  get 'user_console/index'

  # Homepage routes
  get 'home_page/index'
  root 'home_page#index'

  # Users routes
  get 'users/login'
  post 'users/auth'
  resources :users

  # User Console routes
  get 'user_console/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
