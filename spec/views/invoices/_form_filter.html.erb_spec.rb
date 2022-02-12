# frozen_string_literal: true

describe 'invoices/_form_filter' do
  before { render }

  it 'renders new session form' do
    assert_select 'form[action=?][method=?]', invoices_path, 'get' do
      assert_select 'input[name=?]', 'term'
      assert_select '[type=submit][value=?]', t('invoices.form_filter.submit')
    end
  end
end
