# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root 'pages#home'

  namespace :admin do
    root 'products#index', as: :admin_root
    resources :products
  end

  resources :products, only: %i[show]
  get 'cart', to: "carts#show"
  delete 'cart', to: "carts#destroy"

  # get 'carts/:id', to: 'carts#show', as: 'cart'
  #delete 'carts/:id', to: 'carts#destroy'

  post 'carts', to: 'carts#add', as: 'add_to_cart'
end
