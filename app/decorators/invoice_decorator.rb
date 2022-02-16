# frozen_string_literal: true

module InvoiceDecorator
  include RoutesAndHelpers

  def formatted_invoice_date
    return '--' if invoice_date.blank?

    invoice_date.strftime('%d/%m/%Y')
  end

  def formatted_total_amount_due
    h.number_to_currency(total_amount_due)
  end

  def customer_notes
    super.presence || '--'
  end

  def email
    super.presence || '--'
  end

  def link_to_file_url
    return if file_url.blank?

    h.link_to(file_url, class: 'btn btn-sm btn-outline-info') do
      h.t('invoice_decorator.links.pdf')
    end
  end
end
