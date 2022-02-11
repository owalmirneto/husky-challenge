# frozen_string_literal: true

describe 'invoices/new' do
  before do
    assign(:invoice, invoice)

    render
  end

  let(:invoice) { build(:invalid_invoice) }
  let(:invoice_field_names) do
    [:invoice_number, :invoice_date, :total_amount_due, :customer_name,
     :emails, :customer_notes]
  end

  it 'renders page title' do
    expect(rendered).to have_css('h1', text: t('invoices.new.title'))
  end

  it 'renders new invoice form' do
    assert_select('form[action=?][method=?]', invoices_path, 'post')
  end

  it 'renders invoice fields in form' do
    invoice_field_names.each do |field|
      expect(rendered).to have_field("invoice[#{field}]")
    end
  end

  it 'renders submit button in form' do
    expect(rendered).to have_button(submit_action_label(Invoice))
  end

  it 'renders link to back to invoices' do
    expect(rendered)
      .to have_link(t('invoices.new.back_to_list'), href: invoices_path)
  end
end
