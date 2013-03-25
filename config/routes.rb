Char::Application.routes.draw do
  devise_for :users

  root to: 'dashboards#show'

  resources :posts do
    resources :revisions, only: [:index, :show]
    resources :reviews
  end

  resource :dashboard, only: [:show]

  resources :users, only: [:edit, :update, :show, :index]
end
