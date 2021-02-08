namespace :api, defaults: { format: :json }do
  namespace :v1 do

    resources :articles do
      resources :comments, only: %i[create update destroy]
    end

    resource :user, only: %i[] do
      post 'log_up'
      post 'log_in'
      delete 'log_out'
    end
  end
end
