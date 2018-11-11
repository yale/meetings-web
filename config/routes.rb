Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # config/routes.rb

  get 'auth/oauth2/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'

  get 'logout' => 'logout#logout'

  resources :users, only: [:edit, :update]

  resources :meetings do
    member do
      resources :attendences
    end
  end

  namespace :api do
    namespace :v1 do
      resources :scans, only: [:create]
    end
  end
end
