Rails.application.routes.draw do

  namespace :user_console do
    get 'demo/index'
  end

  get 'user_console/index'

  # Homepage routes
  get 'home_page/index'
  root 'home_page#index'

  # Users routes
  get 'users/login'
  post 'users/auth'
  get 'users/logout'
  resources :users

  # User Console routes
  get 'user_console/index'

  namespace :user_console do

    get 'demo/index'

    get 'demo/page_rank_prepare'

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
