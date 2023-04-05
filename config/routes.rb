# frozen_string_literal: true

Rails.application.routes.draw do
  get 'products/show'
  devise_for :admins
  devise_for :users
  root 'pages#home'

  namespace :admin do
    root 'products#index', as: :admin_root
    resources :products
  end

  resources :products, only: %i[show]
  resources :orders, only: %i[create]
  get 'cart', to: "carts#show"
  delete 'cart', to: "carts#destroy"
  post 'cart', to: 'carts#add', as: 'add_to_cart'
end
