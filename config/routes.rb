require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    root 'articles#index'
    devise_for :users
    resources :articles do
      resources :comments, only: %i[create update destroy]
      get :view_modal, on: :member
    end
  end
end
