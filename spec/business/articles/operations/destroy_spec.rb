# frozen_string_literal: true

require 'rails_helper'

describe Articles::Operations::Destroy do
  let!(:article) { create(:article) }

  subject { described_class.call(record: article) }

  describe '.call' do
    context 'with valid params' do
      it 'delete article with dependencies' do
        subject

        expect { article.reload }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
