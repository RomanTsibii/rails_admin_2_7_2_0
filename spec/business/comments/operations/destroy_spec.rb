# frozen_string_literal: true

require 'rails_helper'

describe Comments::Operations::Destroy do
  let!(:comment) { create(:comment) }

  subject { described_class.call(record: comment) }

  describe '.call' do
    context 'with valid params' do
      it 'delete comment' do
        subject

        expect { comment.reload }.to raise_error ActiveRecord::RecordNotFound
        expect(subject.status).to eq('no_content')
      end
    end
  end
end
