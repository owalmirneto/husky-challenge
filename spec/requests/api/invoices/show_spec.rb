# frozen_string_literal: true

describe '/api/v1/invoices', type: :request do
  include_context 'when api user logged'

  before do
    get api_v1_invoice_path(invoice_id), headers: authorized_headers
  end

  let(:invoice) { create(:invoice_with_pdf) }
  let(:invoice_id) { invoice.id }
  let(:response_data) { json_body[:data] }
  let(:response_attributes) { json_body.dig(:data, :attributes) }
  let(:expected_response_keys) do
    [:'invoice-number', :'customer-name', :'customer-notes', :'file-url',
     :'invoice-date', :'total-amount-due']
  end

  describe 'GET /show' do
    context 'when non-existent invoice' do
      let(:invoice_id) { random_uuid }

      it 'renders a not found response' do
        expect(response).to be_not_found
      end

      it 'renders a successful response' do
        expect(json_body[:errors]).to eq([t('application.record_not_found')])
      end
    end

    context 'when existent invoice' do
      it 'renders a successful response' do
        expect(response).to be_successful
      end

      it 'have invoice id' do
        expect(response_data[:id]).to eq(invoice.id)
      end

      it 'have invoice type' do
        expect(response_data[:type]).to eq('invoices')
      end

      it 'have invoice attributes' do
        expect(response_attributes).to include(*expected_response_keys)
      end
    end

    context 'when current user not found' do
      let(:current_user) { build(:user) }

      it 'renders a unauthorized response' do
        expect(response).to be_unauthorized
      end

      it 'renders a successful response' do
        expect(json_body[:errors]).to eq([t('application.api.unauthorized')])
      end
    end
  end
end
