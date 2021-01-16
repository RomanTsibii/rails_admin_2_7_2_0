# frozen_string_literal: true

require 'rails_helper'

describe Articles::Operations::Update do
  let!(:article) { create :article }
  subject { described_class.call(record_params: record_params, record: article) }

  describe '.call' do
    context 'with valid params' do
      let(:record_params) do
        {
          title: 'Title updated',
          content: 'Content updated'
        }
      end

      it 'update article' do
        subject

        expect(article.title).to eq record_params[:title]
        expect(article.content.present?).to eq true
      end
    end

    context 'with invalid params' do
      let(:record_params) do
        {
          title: nil,
          content: nil
        }
      end

      it 'update article' do
        response = subject

        expect(response.status).to eq 'bad_request'
        expect(response.errors.keys).to include(:title, :content)
      end
    end
  end
end
