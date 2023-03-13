# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root 'pages#home'

  namespace :admin do
    root "products#index", as: :admin_root
    resources :products
  end

end



