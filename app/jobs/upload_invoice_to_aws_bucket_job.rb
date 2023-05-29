# frozen_string_literal: true

class UploadInvoiceToAwsBucketJob < ApplicationJob
  def perform(invoice_id)
    invoice = Invoice.find(invoice_id)

    Invoices::UploadPDFOrganizer.call(invoice: invoice)
  end
end
