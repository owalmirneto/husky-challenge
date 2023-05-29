# frozen_string_literal: true

module API
  module V1
    describe InvoicesController, type: :routing do
      describe 'routing' do
        it 'routes to #index' do
          expect(get: '/api/v1/invoices').to route_to('api/v1/invoices#index')
        end

        it 'routes to #show' do
          expect(get: '/api/v1/invoices/1').to route_to('api/v1/invoices#show', id: '1')
        end

        it 'routes to #create' do
          expect(post: '/api/v1/invoices').to route_to('api/v1/invoices#create')
        end
      end
    end
  end
end
