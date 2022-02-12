# frozen_string_literal: true

class InvoicesController < AuthenticatedController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

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

  def edit
  end

  # rubocop:disable Metrics/MethodLength
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html do
          redirect_to invoice_url(@invoice), notice: 'Invoice was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  def show
  end

  def destroy
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
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
