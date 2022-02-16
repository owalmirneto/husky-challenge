# frozen_string_literal: true

class InvoiceDetailComponent < ApplicationComponent
  def initialize(invoice:)
    @invoice = invoice.decorate
  end
end
