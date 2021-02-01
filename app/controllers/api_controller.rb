class ApiController < ActionController::API
  # TODO: add policy
  # include Pundit
  include I18nLocalise
  respond_to :json

  # before_action :authenticate_user!
  before_action :set_locale
  before_action :default_url_options
end
