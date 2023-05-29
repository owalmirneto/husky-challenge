# frozen_string_literal: true

describe '/api/v1/invoices', type: :request do
  include_context 'when api user logged'

  before do
    invoices
    get api_v1_invoices_path, params: request_params,
                              headers: authorized_headers
  end

  let(:invoice_quantity) { 5 }
  let(:invoices) { create_list(:invoice_with_pdf, invoice_quantity) }

  describe 'GET /index' do
    let(:random_invoice) { invoices.sample }

    context 'when no invoices filters' do
      let(:request_params) { {} }

      it 'renders a successful response' do
        expect(response).to be_successful
      end

      it 'have 5 invoices' do
        expect(json_body[:data].size).to eq(invoice_quantity)
      end
    end

    context 'when filter invoices' do
      let(:random_invoice_data) { json_body[:data].sample }
      let(:request_params) { { term: random_invoice.invoice_number } }

      it 'renders a successful response' do
        expect(response).to be_successful
      end

      it 'have only one invoice' do
        expect(json_body[:data].size).to eq(1)
      end

      it 'have response attribute keys' do
        expect(json_body).to include(:data, :links)
      end

      it 'have invoice attribute keys' do
        expect(random_invoice_data).to include(:id, :type, :attributes)
      end
    end
  end
end
