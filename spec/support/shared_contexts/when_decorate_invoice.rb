# frozen_string_literal: true

shared_context 'when decorate invoice' do
  before do
    InvoiceDecorator.include?(ActionView::Helpers::NumberHelper) ||
      InvoiceDecorator.include(ActionView::Helpers::NumberHelper)

    Invoice.include?(InvoiceDecorator) || Invoice.include(InvoiceDecorator)
  end
end
