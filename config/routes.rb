Char::Application.routes.draw do

  authenticated :user do
      root to: "dashboards#show", as: "authenticated_root"
  end

  root to: "blog#index"

  resources :blog

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
