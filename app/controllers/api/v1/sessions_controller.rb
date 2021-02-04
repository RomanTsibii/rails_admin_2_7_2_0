class Api::V1::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  respond_to :json

  def create
    super
  end

  private

  # def respond_with(resource, _opts = {})
  # render json: resource, :jwt_token
  # end

  def respond_to_on_destroy
    head :ok
  end
end
