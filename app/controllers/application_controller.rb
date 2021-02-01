class ApplicationController < ActionController::Base
  include Pundit
  include I18nLocalise

  before_action :authenticate_user!
end
