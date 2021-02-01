require 'rails_helper'

describe 'articles routes' do
  context 'api' do
    it 'should route to article index' do
      expect(get('api/v1/articles')).to route_to('api/v1/articles#index', format: :json)
    end

    it 'should route to article show' do
      expect(get('api/v1/articles/1')).to route_to('api/v1/articles#show', id: '1', format: :json)
    end
  end
end
