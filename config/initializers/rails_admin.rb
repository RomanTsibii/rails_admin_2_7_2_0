RailsAdmin.config do |config|

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.admin?
  end

  config.model 'ActiveStorage::Blob' do
    visible false
  end

  config.model 'ActiveStorage::Attachment' do
    visible false
  end

  config.model 'ActionText::RichText' do
    visible false
  end

  config.model 'Article' do
    list do
      field :id
      field :title
      field :created_at
      field :count_comments
      field :cover_image
    end

    create do
      field :title
      field :content
      field :cover_image
    end
    update do
      field :title
      field :content
      field :cover_image
    end
  end

  config.model 'User' do
    create do
      field :first_name
      field :last_name
      field :phone_number
      field :role do
        required true
      end
      field :email do
        required true
      end
      field :password do
        required true
      end


    end
  end


  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
