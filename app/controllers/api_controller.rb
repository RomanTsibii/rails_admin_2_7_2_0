class ApiController < ActionController::API
  # TODO: add policy
  # include Pundit
  include I18nLocalise
  respond_to :json

  before_action :authenticate_user!
end
