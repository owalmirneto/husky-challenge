# frozen_string_literal: true

class InvoiceMailer < ApplicationMailer
  def created
    @invoice = params[:invoice]

    mail(to: emails, subject: subject_translation)
  end

  private

  def emails
    @invoice.emails.to_s.split(',')
  end

  def subject_translation
    I18n.t('invoice_mailer.created.subject', number: @invoice.invoice_number)
  end
end
