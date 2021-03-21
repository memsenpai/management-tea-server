# frozen_string_literal: true
Rails.application.routes.draw do
  scope :api, default: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions },
      path_names: { sign_in: :login }
  end
  namespace :api, default: { format: :json } do
    resources :items
    resources :orders
  end
end
