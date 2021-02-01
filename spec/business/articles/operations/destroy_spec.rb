# frozen_string_literal: true

require 'rails_helper'

describe Articles::Operations::Destroy do
  let(:article) { create(:article) }

  subject { described_class.call(record: article) }

  describe '.call' do
    context 'with valid params' do
      it 'delete article with dependencies' do
        subject

        expect(subject.status).to eq('no_content')
      end
    end
  end
end
