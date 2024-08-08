# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, only: :json do
    namespace :v1 do
      resources :recipes, only: %i[index show]
      resources :categories, only: %i[index show]
      get :search, to: 'searches#index'
      get :home, to: 'home#index'
    end
  end

  resources :categories, only: %i[index show]
  resources :recipes, only: %i[index show]
  get :search, to: 'searches#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'pages#index'
end
