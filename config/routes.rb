Rails.application.routes.draw do
  use_doorkeeper
  apipie
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  post 'users/login' => 'sessions#create'
  post 'users/logout' => 'sessions#destroy'

  resources :users, only: [:index, :show, :create, :update, :destroy] do
    resources :posts, only: [:index, :show, :create, :update, :destroy]
  end
end
