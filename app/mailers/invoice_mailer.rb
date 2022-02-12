# frozen_string_literal: true

class InvoiceMailer < ApplicationMailer
  def created
    @invoice = params[:invoice]

    emails = @invoice.emails.to_s.split(',')

    binding.pry

    mail(to: emails, subject: "Invoice ##{@invoice.invoice_number}")
  end
end
