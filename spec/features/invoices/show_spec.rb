# frozen_string_literal: true

describe 'Show invoice details' do
  include_context 'when user logged'

  before { visit(invoice_path(invoice_id)) }

  let(:invoice) { create(:invoice_with_pdf) }
  let(:invoice_id) { invoice.id }

  it 'have page title' do
    expect(page).to have_css('h1', text: t('.invoices.show.title'))
  end

  it 'have invoice number' do
    expect(page).to have_css('p', text: /#{invoice.invoice_number}/)
  end

  it 'returns http success' do
    expect(page).to have_http_status(:success)
  end

  it 'have delete button' do
    within("form[action='#{invoice_path(invoice)}']") do
      expect(page).to have_button(t('link_to.links.destroy'))
    end
  end

  it 'have link to download PDF' do
    expect(page)
      .to have_link(t('invoice_decorator.links.pdf'), href: invoice.file_url)
  end

  context 'when invoice was not found' do
    let(:invoice_id) { random_uuid }

    it 'redirects to invoices page' do
      expect(page).to have_current_path(root_path)
    end

    it 'have alert message' do
      expect(page)
        .to have_css('.alert', text: t('application.record_not_found'))
    end
  end
end
