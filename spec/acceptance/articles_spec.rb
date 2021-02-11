require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Articles' do
  let(:article) { create :article }
  let(:user) { create :admin }

  get '/api/v1/articles' do
    it 'GET Articles' do
      do_request

      expect(status).to eq 200
    end
  end

  get '/api/v1/articles/:id' do
    context 'with valid id' do
      let(:id) { article.id }

      it 'GET article' do
        do_request

        expect(status).to eq 200
      end
    end

    context 'with invalid id', document: false do
      let(:id) { 0 }

      it 'record not exists' do
        do_request

        expect(status).to eq 404
      end
    end
  end

  context 'with token' do
    let(:auth_token) { "Bearer #{Api::JsonWebToken.encode(user_id: user.id)}" }
    header 'Content-Type', 'application/json' # to display the request in JSON format on api/dock page
    header 'Authorization', :auth_token

    before(:example) do
      expect(headers).to include('Authorization')
    end

    post '/api/v1/articles' do
      let(:params) { { article: { title: article.title, content: article.content } } }
      let!(:article) { build :article }
      let(:raw_post) { params.to_json } # to display the request in JSON format on api/dock page

      context 'with valid params' do
        with_options scope: :article, require: true do
          parameter :title, type: :string
          parameter :content, 'action text', type: :string
        end

        with_options scope: :article do
          parameter :cover_image, 'Only image[png, jpeg, jpg]', type: :file
        end

        it 'POST article' do
          do_request

          expect(response_body).to include('content')
          expect(response_body).to include('title')
          expect(status).to eq 201
        end
      end

      context 'with invalid params', document: false do
        let!(:article) { build :article }
        let!(:params) { { article: { title: '', content: '' } } }

        it 'POST article' do
          do_request

          expect(response_body).to include('content')
          expect(response_body).to include('title')
          expect(response_body).to include("can't be blank")
          expect(status).to eq 400
        end
      end
    end

    put '/api/v1/articles/:id' do
      let(:raw_post) { params.to_json } # to display the request in JSON format on api/dock page
      context 'with valid params' do
        let(:article) { create :article }
        let(:params) { { article: { title: article.title, content: article.content } } }
        let(:id) { article.id }

        with_options scope: :article do
          parameter :title, type: :string
          parameter :content, 'action text', type: :string
          parameter :cover_image, 'Only image[png, jpeg, jpg]', type: :file
        end

        it 'PUT article' do
          do_request

          expect(response_body).to include('content')
          expect(response_body).to include('title')
          expect(status).to eq 200
        end
      end
    end

    delete 'api/v1/articles/:id' do
      let!(:article) { create :article }
      let(:id) { article.id }
      let(:raw_post) { params.to_json } # to display the request in JSON format on api/dock page

      context 'with valid params' do

        it 'DELETE article' do
          do_request

          expect(status).to eq 204
        end
      end
    end
  end
end
