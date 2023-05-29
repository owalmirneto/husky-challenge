# frozen_string_literal: true

describe 'Destroy invoice' do
  include_context 'when user logged'

  before { visit(invoice_path(invoice_id)) }

  let(:invoice) { create(:invoice) }
  let(:invoice_id) { invoice.id }

  it 'returns http success' do
    expect(page).to have_http_status(:success)
  end

  it 'have delete button' do
    within("form[action='#{invoice_path(invoice)}']") do
      expect(page).to have_button(t('link_to.links.destroy'))
    end
  end

  context 'when click on delete button' do
    before { click_on(t('link_to.links.destroy')) }

    it 'redirects to invoices page' do
      expect(page).to have_current_path(invoices_path)
    end

    it 'have alert message' do
      expect(page).to have_css('.alert', text: t('invoices.destroy.success'))
    end

    it 'removes invoice from database' do
      expect(Invoice.find_by(id: invoice.id)).to be_blank
    end
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
