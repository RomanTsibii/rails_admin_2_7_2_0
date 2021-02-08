class Api::V1::AuthenticationController < ApiController
  skip_before_action :authenticate_request

  def login
    @res = Api::AuthenticateUser.call(params[:user][:email], params[:user][:password])
    return render json: serialize_res if @res.success?

    render json: { error: @res.errors }, status: :unauthorized
  end

  def logout
    head :ok
  end

  private

  def serialize_res
    token = @res.result
    decoded_token = Api::JsonWebToken.decode(@res.result)
    expired_at = Time.strptime(decoded_token[:exp].to_s, '%s')
    user = User.find_by_email(params[:user][:email])

    UserBlueprint.render(user, view: :login, jwt_token: token, expired_at: expired_at)
  end
end
