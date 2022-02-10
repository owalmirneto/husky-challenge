# frozen_string_literal: true

describe TokensController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/tokens/new').to route_to('tokens#new')
    end

    it 'routes to #create' do
      expect(post: '/tokens').to route_to('tokens#create')
    end
  end
end
