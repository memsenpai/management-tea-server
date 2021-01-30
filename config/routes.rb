# frozen_string_literal: true
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :follows, only: [:index, :create, :destroy]
        resources :sleeps, only: [:index, :create, :update]
      end
    end
  end
end
