# frozen_string_literal: true

describe 'Request for access token' do
  include_context 'when user logged'

  before { visit(new_invoice_path) }

  it 'redirects to invoice form' do
    expect(page).to have_current_path(new_invoice_path)
  end

  context 'when submit form' do
    before { submit_model_form(Invoice, invoice_attributes) }

    let(:invoice_attributes) { attributes_for(:invoice) }

    context 'when valid invoice' do
      let(:created_invoice) do
        Invoice.find_by(emails: invoice_attributes[:emails])
      end

      it 'redirects to invoice detail page' do
        expect(page).to have_current_path(invoice_path(created_invoice))
      end

      it 'creates a new invoice' do
        expect(created_invoice).to be_present
      end

      it 'have alert success message' do
        expect(page).to have_css('.alert', text: t('invoices.create.success'))
      end

      it 'have invoice number' do
        expect(page).to have_content(created_invoice.emails)
      end
    end
  end
end
