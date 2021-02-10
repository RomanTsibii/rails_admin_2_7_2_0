class ApiController < ActionController::API
  include Pundit
  include I18nLocalise
  respond_to :json

  before_action :authenticate_request
  before_action :record_not_found, only: %i[show update destroy]
  before_action :verify_class, only: %i[index new create]
  before_action :verify_record, except: %i[index new create]

  attr_reader :current_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def user_not_authorized(*errors)
    render json: { errors: errors }, status: :forbidden
  end

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

  def verify_record
    authorize_with_configs(record)
  end

  def verify_class
    authorize_with_configs(record_class)
  end

  def authorize_with_configs(record)
    return true if policy_class.new(current_user,
                                    record).send("#{action_name}?")

    raise Pundit::NotAuthorizedError, "not allowed to #{action_name}"
  end

  def policy_class
    "#{record_class}Policy".constantize
  end
end
