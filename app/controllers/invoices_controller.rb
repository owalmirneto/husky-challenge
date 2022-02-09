# frozen_string_literal: true

class InvoicesController < ApplicationController
  before_action do
    if request.format.html? && !session[:current_user_token]
      redirect_to(root_path,
                  notice: 'Acesso não autorizado!')
    end
  end

  before_action :set_invoice, only: %i[show edit update destroy]

  def index
    @invoices = Invoice.all
  end

  def show; end

  def new
    @invoice = Invoice.new
  end

  def edit; end

  # rubocop:disable Metrics/MethodLength
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html do
          redirect_to invoice_url(@invoice), notice: 'Invoice was successfully created.'
        end
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

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

  def destroy
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def logout
    session.delete(:current_user_token)

    redirect_to(root_path)
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice)
          .permit(:invoice_number, :invoice_date, :customer_name,
                  :customer_notes, :total_amount_due, :emails)
  end
end
