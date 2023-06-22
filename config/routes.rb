Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root 'posts#index'

  resources :users, only: %i[show edit update]

  resources :posts do
    resources :comments, only: %i[new create destroy]
  end
end
