# frozen_string_literal: true

class InvoicesController < AuthenticatedController
  include Invoiceable

  before_action :set_invoice, only: [:show, :destroy]

  def index
    @invoices = query.search(params[:term]).paginate(params[:page])
  end

  def new
    @invoice = Invoice.new
  end

  def create
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
end
