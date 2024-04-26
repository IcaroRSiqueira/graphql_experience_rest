# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount Sidekiq::Web => '/sidekiq'

  get 'policies/:policy_id', controller: 'policies', action: 'show'
end
