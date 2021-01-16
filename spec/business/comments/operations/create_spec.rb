require 'rails_helper'

describe Comments::Operations::Create do
  subject { described_class.call(record_params: record_params) }

  describe '.call' do
    context 'with valid params' do
      let!(:record_params) { attributes_for(:comment) }
      it 'builds comment' do
        expect(subject.status).to eq 'created'
      end
    end

    context 'with invalid params' do
      let!(:record_params) { attributes_for(:article, content: '', commentable: nil, article: nil) }
      it 'builds comment' do
        expect(subject.status).to eq 'bad_request'
        expect(subject.errors[:content]).to include("can't be blank")
        expect(subject.errors[:commentable]).to include("can't be blank")
        expect(subject.errors[:article]).to include("can't be blank")
      end
    end
  end
end
