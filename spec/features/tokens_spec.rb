# frozen_string_literal: true

describe 'Request for access token' do
  before { visit root_path }

  let(:user_attributes) { attributes_for(:user) }
  let(:expected_alert_message) { t('authenticated.unauthorized_access') }

  context 'when access page' do
    it 'returns http success' do
      expect(page).to have_http_status(:success)
    end

    it 'redirects to login page' do
      expect(page).to have_current_path(new_tokens_path)
    end

    it 'have alert message' do
      expect(page).to have_css('.alert', text: expected_alert_message)
    end
  end

  context 'when submit form' do
    before do
      fill_in(:token_email, with: user_attributes[:email])

      click_on(t('tokens.form.submit'))
    end

    context 'with empty user' do
      let(:user_attributes) { attributes_for(:invalid_user) }
      let(:is_not_valid) { t('errors.messages.invalid') }
      let(:cant_be_blank) { t('errors.messages.blank') }

      it 'have invalid message' do
        expect(page).to have_css('.invalid-feedback', text: /#{is_not_valid}/)
      end

      it 'have blank message' do
        expect(page).to have_css('.invalid-feedback', text: /#{cant_be_blank}/)
      end
    end

    context 'with email was valid' do
      let(:created_user) { User.find_by(email: user_attributes[:email]) }

      it 'have alert message' do
        expect(page).to have_css('.alert', text: expected_alert_message)
      end

      it 'creates a new user' do
        expect(created_user).to be_present
      end
    end
  end
end
