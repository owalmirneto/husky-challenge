# frozen_string_literal: true

describe 'Login by URL' do
  before { visit session_path(user.access_token) }

  context 'when existent user' do
    let(:user) { create(:user) }

    it 'returns http success' do
      expect(page).to have_http_status(:success)
    end

    it 'have alert success message' do
      expect(page).to have_css('.alert', text: t('sessions.create.success'))
    end

    it 'redirects to invoices page' do
      expect(page).to have_current_path(invoices_path)
    end
  end

  context 'when non-existent user' do
    let(:user) { build(:user) }

    it 'have alert failure message' do
      expect(page).to have_css('.alert', text: t('sessions.create.failure'))
    end

    it 'redirects to invoices page' do
      expect(page).to have_current_path(new_sessions_path)
    end
  end
end
