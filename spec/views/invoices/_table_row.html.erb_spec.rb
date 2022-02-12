# frozen_string_literal: true

describe 'invoices/_table_row' do
  before do
    InvoiceDecorator.include(ActionView::Helpers::NumberHelper)
    render('invoices/table_row', invoice: invoice)
  end

  let(:invoice) { create(:invoice).extend(InvoiceDecorator) }

  context 'with existent invoices' do
    it 'have invoice invoice_number' do
      expect(rendered).to have_css('td', text: invoice.invoice_number)
    end

    it 'have invoice invoice_date' do
      expect(rendered).to have_css('td', text: invoice.formatted_invoice_date)
    end

    it 'have invoice customer_name' do
      expect(rendered).to have_css('td', text: invoice.customer_name)
    end

    it 'have invoice total_amount_due' do
      expect(rendered)
        .to have_css('td', text: invoice.formatted_total_amount_due)
    end

    it 'have invoice emails' do
      expect(rendered).to have_css('td', text: invoice.emails)
    end

    it 'have link to invoice details' do
      expect(rendered)
        .to have_link('Show this invoice', href: invoice_path(invoice))
    end
  end
end
