# frozen_string_literal: true

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/invoices', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Invoice. As you add validations to Invoice, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { emails: 'email@example.com' }
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  before { post tokens_url, params: { token: '123456' } }

  describe 'GET /index' do
    it 'renders a successful response' do
      Invoice.create! valid_attributes
      get invoices_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      invoice = Invoice.create! valid_attributes
      get invoice_url(invoice)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_invoice_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      invoice = Invoice.create! valid_attributes
      get edit_invoice_url(invoice)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Invoice' do
        expect do
          post invoices_url, params: { invoice: valid_attributes }
        end.to change(Invoice, :count).by(1)
      end

      it 'redirects to the created invoice' do
        post invoices_url, params: { invoice: valid_attributes }
        expect(response).to redirect_to(invoice_url(Invoice.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Invoice' do
        expect do
          post invoices_url, params: { invoice: invalid_attributes }
        end.to change(Invoice, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post invoices_url, params: { invoice: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested invoice' do
        invoice = Invoice.create! valid_attributes
        patch invoice_url(invoice), params: { invoice: new_attributes }
        invoice.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the invoice' do
        invoice = Invoice.create! valid_attributes
        patch invoice_url(invoice), params: { invoice: new_attributes }
        invoice.reload
        expect(response).to redirect_to(invoice_url(invoice))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        invoice = Invoice.create! valid_attributes
        patch invoice_url(invoice), params: { invoice: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested invoice' do
      invoice = Invoice.create! valid_attributes
      expect do
        delete invoice_url(invoice)
      end.to change(Invoice, :count).by(-1)
    end

    it 'redirects to the invoices list' do
      invoice = Invoice.create! valid_attributes
      delete invoice_url(invoice)
      expect(response).to redirect_to(invoices_url)
    end
  end
end
