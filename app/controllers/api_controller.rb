class ApiController < ActionController::API
  # TODO: add policy
  # include Pundit
  include I18nLocalise
  respond_to :json

  # before_action :authenticate_user!
  # after_action :skip_session
  before_action :record_not_found, only: %i[show update destroy]

  protected

  def record
    @record ||= record_class.where(id: params[:id]).first
  end

  def records
    @records ||= record_class.order(id: :asc)
  end

  def record_not_found
    render json: { error: 'record not found' }, status: :not_found if record.nil?
  end
end
