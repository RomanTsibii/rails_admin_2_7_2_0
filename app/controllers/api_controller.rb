class ApiController < ActionController::API
  # TODO: add policy
  # include Pundit
  include I18nLocalise
  respond_to :json

  before_action :authenticate_request
  before_action :record_not_found, only: %i[show update destroy]

  attr_reader :current_user

  protected

  def authenticate_request
    @current_user = Api::AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

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
