require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Comments' do
  let(:article) { create :article }
  let(:user) { create :member }
  let(:article_id) { article.id }

  context 'with Authorization' do
    let(:auth_token) { "Bearer #{Api::JsonWebToken.encode(user_id: user.id)}" }
    header 'Content-Type', 'application/json' # to display the request in JSON format on api/dock page
    header 'Authorization', :auth_token

    before(:example) do
      expect(headers).to include('Authorization')
    end

    post '/api/v1/articles/:article_id/comments' do
      let(:comment) { build :comment }
      let(:params) { { comment: { content: comment.content } } }
      let(:raw_post) { params.to_json } # to display the request in JSON format on api/dock page

      with_options scope: :comment, require: true do
        parameter :content, 'Action Text', type: :string
      end

      it 'POST comment' do
        do_request

        expect(response_body).to include(comment.content.name)
        expect(response_body).to include(user.email)
        expect(status).to eq 201
      end
    end

    put '/api/v1/articles/:article_id/comments/:id' do
      let(:comment) { create :comment, commentable: user }
      let(:id) { comment.id }
      let(:params) { { comment: { content: 'Updated data' } } }
      let(:raw_post) { params.to_json } # to display the request in JSON format on api/dock page

      with_options scope: :comment do
        parameter :content, 'Action text', type: :string
      end

      it 'PUT comment' do
        do_request

        expect(response_body).to include('Updated data')
        expect(status).to eq 200
      end
    end

    delete 'api/v1/articles/:article_id/comments/:id' do
      let(:comment) { create :comment, commentable: user }
      let(:id) { comment.id }

      it 'DELETE comment' do
        do_request

        expect(status).to eq 204
      end
    end
  end
end
