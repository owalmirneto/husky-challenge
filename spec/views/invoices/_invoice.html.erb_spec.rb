# frozen_string_literal: true

describe 'invoices/_invoice' do
  before do
    InvoiceDecorator.include(ActionView::Helpers::NumberHelper)
    Invoice.include(InvoiceDecorator)

    render('invoices/invoice', invoice: invoice)
  end

  let(:invoice) { create(:invoice) }

  context 'with existent invoices' do
    it 'have invoice invoice_number' do
      expect(rendered).to have_content(invoice.invoice_number)
    end

    it 'have invoice invoice_date' do
      expect(rendered).to have_content(invoice.formatted_invoice_date)
    end

    it 'have invoice customer_name' do
      expect(rendered).to have_content(invoice.customer_name)
    end

    it 'have invoice total_amount_due' do
      expect(rendered).to have_content(invoice.formatted_total_amount_due)
    end

    it 'have invoice emails' do
      expect(rendered).to have_content(invoice.emails)
    end
  end
end
