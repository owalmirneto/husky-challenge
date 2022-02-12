# frozen_string_literal: true

describe 'invoices/index' do
  before do
    assign(:invoices, invoices)

    render
  end

  let(:invoices) { Invoice.none }

  it 'renders page title' do
    expect(rendered).to have_css('h1', text: t('invoices.index.title'))
  end

  it 'renders link to create invoice' do
    expect(rendered)
      .to have_link(t('invoices.index.link_to_new'), href: new_invoice_path)
  end

  context 'with empty invoices' do
    let(:alert_message) { t('records.not_found', model: tm(Invoice).downcase) }

    it 'have alert message' do
      expect(rendered).to have_css('.alert', text: alert_message)
    end
  end

  context 'with existent invoices' do
    let(:invoices) { create_list(:invoice, 5) }

    it 'have 5 invoices' do
      expect(rendered).to have_css('tbody tr', count: 5)
    end

    it 'have invoice dom_id' do
      invoices.each do |invoice|
        expect(rendered).to have_css("tr#invoice_#{invoice.id}")
      end
    end
  end
end
