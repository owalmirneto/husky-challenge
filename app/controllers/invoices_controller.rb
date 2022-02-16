# frozen_string_literal: true

class InvoicesController < AuthenticatedController
  before_action :set_invoice, only: [:show, :destroy]

  def index
    @invoices = query.search(params[:term]).paginate(params[:page])
  end

  def new
    @invoice = Invoice.new
  end

  def create
    organizer = CreateInvoiceOrganizer.call(params: invoice_params)

    if organizer.success?
      redirect_to(organizer.invoice, notice: t('.success'))
    else
      @invoice = organizer.invoice
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @invoice.destroy

    redirect_to(invoices_url, notice: t('.success'))
  end

  private

  def query
    @query ||= InvoicesQuery.new
  end

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice)
          .permit(:invoice_number, :invoice_date, :customer_name,
                  :customer_notes, :total_amount_due, :emails)
  end
end
