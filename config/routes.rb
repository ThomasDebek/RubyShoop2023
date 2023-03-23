# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root 'pages#home'

  namespace :admin do
    root "products#index", as: :admin_root
    resources :products
  end

  get 'carts/:id', to: "carts#show", as: "cart"
  post 'carts', to: "carts#add", as: "add_to_cart"


end



