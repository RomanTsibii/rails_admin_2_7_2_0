# frozen_string_literal: true

require 'rails_helper'

describe Comments::Operations::Update do
  let!(:comment) { create :comment }
  subject { described_class.call(record_params: record_params, record: comment) }

  describe '.call' do
    context 'with valid params' do
      let(:record_params) do
        {
          content: 'Content updated',
          commentable: comment.commentable,
          article: comment.article
        }
      end

      it 'update article' do
        res = subject

        expect(res.status).to eq 'ok'
        expect(comment.content.present?).to eq true
      end
    end

    context 'with invalid params' do
      let(:record_params) do
        {
          content: nil,
          commentable: nil,
          article: nil
        }
      end

      it 'update article' do
        response = subject

        expect(response.status).to eq 'bad_request'
        expect(response.errors.keys).to include(:content, :commentable, :article)
      end
    end
  end
end
