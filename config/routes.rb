require 'sidekiq/web'

Rails.application.routes.draw do
  root 'articles#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  resources :articles do
    resources :comments, only: %i[create update destroy]
    get :view_modal, on: :member
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
