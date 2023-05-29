# frozen_string_literal: true

describe 'Create invoices' do
  include_context 'when user logged'

  before { visit(new_invoice_path) }

  it 'redirects to invoice form' do
    expect(page).to have_current_path(new_invoice_path)
  end

  context 'when submit form' do
    before { submit_model_form(Invoice, invoice_attributes.except(:file_url)) }

    context 'with valid invoice' do
      let(:invoice_attributes) { attributes_for(:invoice) }

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

    context 'with invalid invoice' do
      let(:invoice_attributes) { attributes_for(:invalid_invoice) }
      let(:required_attributes) { Invoice.validators.map(&:attributes).flatten }
      let(:blank_message) { t('errors.messages.blank') }

      it 'stay on invoice form page' do
        expect(page).to have_current_path(invoices_path)
      end

      it 'have 5 message errors' do
        required_attributes.map do |attribute|
          label = t("activerecord.attributes.invoice.#{attribute}")
          expect(page).to have_css('.invalid-feedback',
                                   text: "#{label} #{blank_message}")
        end
      end
    end
  end
end
