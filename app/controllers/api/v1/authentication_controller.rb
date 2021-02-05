class Api::V1::AuthenticationController < ApiController
  skip_before_action :authenticate_request

  def login
    res = Api::AuthenticateUser.call(params[:user][:email], params[:user][:password])
    user = User.find_by_email(params[:user][:email])

    return render json: AuthenticationBlueprint.render(user, jwt_token: res.result) if res.success?

    render json: { error: res.errors }, status: :unauthorized
  end

  # TODO: create Logout
  # def logout; end
end
