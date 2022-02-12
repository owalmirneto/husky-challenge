# frozen_string_literal: true

describe 'Listing invoices' do
  include_context 'when user logged'

  before { visit(new_invoice_path) }
end
