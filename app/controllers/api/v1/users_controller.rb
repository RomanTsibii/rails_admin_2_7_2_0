class Api::V1::UsersController < ApiController
  skip_before_action :authenticate_request
  skip_before_action :verify_class
  skip_before_action :verify_record

  def log_in
    @res = Api::AuthenticateUser.call(params[:user][:email], params[:user][:password])
    return render json: serialize_res if @res.success?

    render json: { error: @res.errors }, status: :unauthorized
  end

  def log_out
    head :ok
  end

  def log_up
    @res = Api::Users::Operations::LogUp.call(record_params: record_params)
    return render json: UserBlueprint.render(@res.data[:record]), status: :created if @res.created?

    render json: { error: @res.data[:errors] }, status: @res.status.to_sym
  end

  private

  def serialize_res
    token = @res.result
    decoded_token = Api::JsonWebToken.decode(@res.result)
    expired_at = Time.strptime(decoded_token[:exp].to_s, '%s')
    user = User.find_by_email(params[:user][:email])

    UserBlueprint.render(user, view: :login, jwt_token: token, expired_at: expired_at)
  end

  def record_params
    params.require(:user).permit!
  end
end
