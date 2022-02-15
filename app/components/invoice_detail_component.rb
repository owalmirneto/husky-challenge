# frozen_string_literal: true

class InvoiceDetailComponent < ApplicationComponent
  def initialize(invoice:)
    @invoice = invoice
  end
end
