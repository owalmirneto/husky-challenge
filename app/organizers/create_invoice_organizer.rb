# frozen_string_literal: true

class CreateInvoiceOrganizer < ApplicationOrganizer
  organize CreateInvoice, SendInvoiceMail
end
