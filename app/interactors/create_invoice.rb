# frozen_string_literal: true

class CreateInvoice < ApplicationInteractor
  def call
    context.invoice = Invoice.new(context.params)

    context.fail! unless context.invoice.save
  end
end
