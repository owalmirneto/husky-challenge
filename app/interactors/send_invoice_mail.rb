# frozen_string_literal: true

class SendInvoiceMail < ApplicationInteractor
  delegate :invoice, to: :context

  def call
    mailer.created.deliver_later if invoice.persisted?
  end

  private

  def mailer
    @mailer ||= InvoiceMailer.with(invoice: invoice)
  end
end
