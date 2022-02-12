# frozen_string_literal: true

module InvoiceDecorator
  def formatted_invoice_date
    return '--' if invoice_date.blank?

    invoice_date.strftime('%d/%m/%Y')
  end

  def formatted_total_amount_due
    number_to_currency(total_amount_due)
  end
end
