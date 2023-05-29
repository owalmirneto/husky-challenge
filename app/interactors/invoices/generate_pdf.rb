# frozen_string_literal: true

module Invoices
  class GeneratePDF < ApplicationInteractor
    def call
      context.filename = "fatura-#{invoice.id}.pdf"

      pdf.text("Fatura ##{invoice.invoice_number}", size: 18, style: :bold)

      PrawnHtml.append_html(pdf, content_file)

      pdf.render_file("tmp/#{context.filename}")
    end

    private

    delegate :invoice, to: :context

    def pdf
      @pdf ||= Prawn::Document.new
    end

    def content_file
      @content_file ||= action_base.render_to_string(view_component)
    end

    def action_base
      @action_base ||= ActionController::Base.new
    end

    def view_component
      @view_component ||= InvoiceDetailComponent.new(invoice: invoice)
    end
  end
end
