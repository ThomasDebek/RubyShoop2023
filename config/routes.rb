# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root 'pages#home'

  namespace :admin do
    get 'products/index'
    root "products#index"
  end

end



