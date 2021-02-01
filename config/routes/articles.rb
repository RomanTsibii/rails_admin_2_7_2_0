resources :articles do
  resources :comments, only: %i[create update destroy]
  get :view_modal, on: :member
end
