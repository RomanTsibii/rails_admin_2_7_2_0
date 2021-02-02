Rails.application.routes.draw do
  draw :sidekiq
  draw :admin

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'articles#index'
    devise_for :users
    draw :articles
  end
  draw :api
end
