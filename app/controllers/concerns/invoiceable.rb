# frozen_string_literal: true

module Invoiceable
  extend ActiveSupport::Concern

  included do
    private

    def organizer
      @organizer ||= CreateInvoiceOrganizer.call(params: invoice_params)
    end

    def query
      @query ||= InvoicesQuery.new
    end

    def set_invoice
      @invoice = query.find(params[:id])
    end

    def invoice_params
      params.require(:invoice)
            .permit(:invoice_number, :invoice_date, :customer_name,
                    :customer_notes, :total_amount_due, :emails)
    end
  end
end
