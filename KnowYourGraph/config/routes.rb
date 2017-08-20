Rails.application.routes.draw do

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
  get 'user_console/tasks'
  post 'user_console/upload_data_source'

  namespace :user_console do

    get 'demo/index'

    get 'demo/page_rank_prepare'

    post 'demo/page_rank'

    get 'tasks/index'
    resources :tasks

    resources :graph_data_files

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
