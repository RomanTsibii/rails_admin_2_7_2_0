require 'rails_helper'

describe Api::Users::Operations::LogUp do
  subject { described_class.call(record_params: record_params) }

  describe '.call' do
    context 'with valid params' do
      let(:record_params) { attributes_for(:user) }
      it 'builds User' do
        expect(subject.status).to eq 'created'
      end
    end

    context 'with invalid params' do
      let!(:record_params) { attributes_for(:user, email: '', password: '', password_confirmation: '') }
      it 'builds User' do
        expect(subject.status).to eq 'bad_request'
        expect(subject.errors[:email]).to include("can't be blank")
        expect(subject.errors[:password]).to include("can't be blank")
        expect(subject.errors[:password_confirmation]).to include("can't be blank")
      end
    end

    context 'with invalid params' do
      let!(:record_params) { attributes_for(:user, password: '123423', password_confirmation: '1231') }
      it 'builds User with different password' do
        expect(subject.status).to eq 'bad_request'
        expect(subject.errors[:password_confirmation]).to include("doesn't match Password")
      end
    end
  end
end
