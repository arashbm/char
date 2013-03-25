Char::Application.routes.draw do

  root to: 'dashboards#show'

  devise_for :users

  resources :blueprints do
    resources :discussions
  end

  resources :posts do
    resources :revisions, only: [:index, :show]
    resources :reviews
  end

  resource :dashboard, only: [:show]

  resources :users, only: [:edit, :update, :show, :index]
end
