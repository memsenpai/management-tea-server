# frozen_string_literal: true
Rails.application.routes.draw do
  namespace :api do
    resources :v1, only: [:index], controller: "/docs/v1/root"
    namespace :v1 do
      resources :users do
        resources :follows, only: [:index, :create, :destroy]
        resources :sleeps, only: [:index, :create, :update]
      end
    end
  end

  mount SwaggerUiEngine::Engine, at: "/docs"
end
