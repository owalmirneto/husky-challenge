# frozen_string_literal: true

module Invoices
  class UploadPDFOrganizer < ApplicationOrganizer
    organize GeneratePDF, UploadPDF, UpdateFileUrl
  end
end
