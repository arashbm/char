Char::Application.routes.draw do

  root to: 'dashboards#show'

  resources :posts

  resource :dashboard, only: [:show]

  resources :users, controller: 'users',
    only: [:show, :edit, :update, :index, :create, :new] do
    resource :password,
        :controller => 'clearance/passwords',
        :only => [:create, :edit, :update]
    end
end
