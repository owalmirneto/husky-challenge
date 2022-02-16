# frozen_string_literal: true

module Invoices
  class UpdateFileUrl < ApplicationInteractor
    def call
      context.invoice.update!(file_url: context.public_url)
    end
  end
end
