require 'rails_helper'

describe Articles::Operations::Create do
  subject { described_class.call(record_params: record_params) }

  describe '.call' do
    let(:record_params) { attributes_for(:article, :with_cover_image) }

    context 'with valid params' do
      it 'builds article' do
        expect(subject.status).to eq 'created'
      end
    end
  end

  describe '.call' do
    let!(:record_params) { attributes_for(:article, title: '', content: '') }

    context 'with invalid params' do
      it 'builds article' do
        expect(subject.status).to eq 'bad_request'
        expect(subject.errors[:title]).to include("can't be blank")
        expect(subject.errors[:content]).to include("can't be blank")
      end
    end
  end
end
