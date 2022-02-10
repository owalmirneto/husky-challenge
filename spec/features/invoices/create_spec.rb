# frozen_string_literal: true

describe 'Request for access token' do
  before do
    visit session_path(user.access_token)

    visit invoices_path
  end

  let(:user) { create(:user) }

  context 'when access page' do
    it 'redirects to login page' do
      expect(page).to have_current_path(invoices_path)
    end
  end
end
