Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users, only: [:index, :show, :create, :update, :destroy] do
    resources :posts, only: [:index, :show, :create, :update, :destroy]
  end
end
