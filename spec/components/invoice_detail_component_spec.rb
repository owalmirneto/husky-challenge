# frozen_string_literal: true

describe InvoiceDetailComponent, type: :component do
  before { render_inline(described_class.new(invoice: invoice)) }

  let(:invoice) { create(:invoice).decorate }

  context 'with existent invoices' do
    it 'have invoice invoice_number' do
      expect(rendered_component).to have_content(invoice.invoice_number)
    end

    it 'have invoice invoice_date' do
      expect(rendered_component).to have_content(invoice.formatted_invoice_date)
    end

    it 'have invoice customer_name' do
      expect(rendered_component).to have_content(invoice.customer_name)
    end

    it 'have invoice total_amount_due' do
      expect(rendered_component).to have_content(invoice.formatted_total_amount_due)
    end

    it 'have invoice emails' do
      expect(rendered_component).to have_content(invoice.emails)
    end
  end
end
