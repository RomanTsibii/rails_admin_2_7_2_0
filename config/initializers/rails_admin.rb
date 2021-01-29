RailsAdmin.config do |config|

  ## == I18n ==
  config.included_models = %w[Article Article::Translation User Comment]

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.admin?
  end

  config.model 'Article' do
    configure :translations, :globalize_tabs

    list do
      field :id
      field :title
      field :created_at
      field :count_comments
      field :cover_image
    end

    create do
      field :translations
      field :cover_image
    end

    update do
      field :translations
      field :cover_image
    end
  end

  config.model 'Article::Translation' do
    visible false
    configure :locale, :hidden do
      help ''
    end
    field :title do
      required true
    end
    include_fields :locale, :title, :content
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

    update do
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
