# frozen_string_literal: true

describe 'Login by access token' do
  before { visit new_sessions_path }

  let(:user_attributes) { attributes_for(:user) }

  context 'when access page' do
    it 'returns http success' do
      expect(page).to have_http_status(:success)
    end

    it 'redirects to login page' do
      expect(page).to have_current_path(new_sessions_path)
    end
  end

  context 'when submit form' do
    before do
      fill_in(:session_access_token, with: user_attributes[:access_token])

      click_on(t('sessions.form.submit'))
    end

    context 'with empty user' do
      let(:user_attributes) { attributes_for(:invalid_user) }

      it 'have alert failure message' do
        expect(page).to have_css('.alert', text: t('sessions.create.failure'))
      end
    end

    context 'with email was valid' do
      let(:user) { create(:user) }
      let(:user_attributes) { { access_token: user.access_token } }

      it 'have alert success message' do
        expect(page).to have_css('.alert', text: t('sessions.create.success'))
      end

      it 'redirects to invoices page' do
        expect(page).to have_current_path(invoices_path)
      end
    end
  end
end
