# frozen_string_literal: true

class SendInvoiceMail < ApplicationInteractor
  delegate :invoice, to: :context

  def call
    return unless invoice.persisted?

    mailer.created.deliver_later

    UploadInvoiceToAwsBucketJob.perform_later(invoice.id)
  end

  private

  def mailer
    @mailer ||= InvoiceMailer.with(invoice: invoice)
  end
end
