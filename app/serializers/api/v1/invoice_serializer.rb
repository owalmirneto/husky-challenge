# frozen_string_literal: true

module API
  module V1
    class InvoiceSerializer < ApplicationSerializer
      attributes :id, :invoice_number, :customer_name, :customer_notes,
                 :file_url

      attribute :formatted_invoice_date, key: :invoice_date
      attribute :formatted_total_amount_due, key: :total_amount_due
    end
  end
end
