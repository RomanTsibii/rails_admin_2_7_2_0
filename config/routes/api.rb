namespace :api, defaults: { format: :json }do
  namespace :v1 do
    devise_scope :user do
      post 'auth/sign_in', to: 'sessions#create'
      delete 'auth/sign_out', to: 'sessions#destroy'
    end

    resources :articles do
      resources :comments, only: %i[create update destroy]
    end
  end
end
