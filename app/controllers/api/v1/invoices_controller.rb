# frozen_string_literal: true

module API
  module V1
    class InvoicesController < ::API::BaseController
      include Invoiceable

      before_action :set_invoice, only: :show

      def index
        @invoices = query.search(params[:term]).paginate(current_page)

        render json: @invoices
      end

      def create
        if organizer.success?
          render json: organizer.invoice, status: :created
        else
          render json: { errors: organizer.invoice.errors },
                 status: :unprocessable_entity
        end
      end

      def show
        render json: @invoice
      end

      private

      def current_page
        params.dig(:page, :number).presence || params[:page]
      end
    end
  end
end
