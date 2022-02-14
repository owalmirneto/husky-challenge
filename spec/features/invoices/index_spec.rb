# frozen_string_literal: true

describe 'Listing invoices' do
  include_context 'when user logged'
  include_context 'when decorate invoice'

  before { visit(invoices_path) }

  it 'have page title' do
    expect(page).to have_css('h1', text: t('.invoices.index.title'))
  end

  it 'have form filter' do
    expect(page).to have_css("form[action='#{invoices_path}'][method='get']")
  end

  context 'when search by invoice number' do
    before do
      create_list(:invoice, 3)
      submit_form_filter(t('invoices.form_filter.submit'), filter_attributes)
    end

    let(:filter_attributes) { { term: invoice.invoice_number } }
    let(:invoice) { Invoice.order('RANDOM()').first }

    it 'have only one invoice' do
      expect(page).to have_css('tbody tr', count: 1)
    end

    it 'have invoice number' do
      expect(page).to have_css('td', text: invoice.invoice_number)
    end

    context 'with searched invoice do not exist' do
      let(:invoice) { build(:invoice) }
      let(:alert_message) do
        t('records.not_found', model: tm(Invoice).downcase)
      end

      it 'have alert message' do
        expect(page).to have_css('.alert', text: alert_message)
      end
    end
  end
end
