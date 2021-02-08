namespace :api, defaults: { format: :json }do
  namespace :v1 do
    post 'authentication/login', to: 'authentication#login'
    delete 'authentication/logout', to: 'authentication#logout'

    resources :articles do
      resources :comments, only: %i[create update destroy]
    end
  end
end
