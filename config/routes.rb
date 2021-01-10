require 'sidekiq/web'

Rails.application.routes.draw do
  root 'article#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  resources :article, only: %i[show]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
