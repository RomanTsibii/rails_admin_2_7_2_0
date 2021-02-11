require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'User' do
  header 'Content-Type', 'application/json' # to display the request in JSON format

  post '/api/v1/user/log_up' do
    let(:raw_post) { params.to_json } # to display the request in JSON format
    let(:user) { build :user }
    let(:params) do
      { user: { email: user.email,
                password: user.password,
                password_confirmation: user.password_confirmation,
                phone_number: user.phone_number,
                first_name: user.first_name,
                last_name: user.last_name } }
    end

    with_options scope: :user, require: true do
      parameter :email, 'unique email'
      parameter :password, 'password'
      parameter :password_confirmation, 'confirm password'
    end

    with_options scope: :user do
      parameter :first_name, 'string'
      parameter :last_name, 'string'
      parameter :phone_number, 'string'
    end

    it 'POST registration(log_up)' do
      do_request

      expect(status).to eq 201
    end
  end

  post 'api/v1/user/log_in' do
    let(:user) { create :user }
    let(:params) { { user: { email: user.email, password: user.password } } }
    let(:raw_post) { params.to_json }

    with_options scope: :user, require: true do
      parameter :email
      parameter :password
    end

    it 'POST log_in' do
      do_request

      expect(response_body).to include('jwt_token')
      expect(status).to eq 200
    end
  end

  delete 'api/v1/user/log_out' do
    it 'DELETE session' do
      do_request

      expect(status).to eq 200
    end
  end
end
