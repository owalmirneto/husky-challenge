# frozen_string_literal: true

shared_context 'when user logged' do
  before { visit session_path(user.access_token) }

  let(:user) { create(:user) }
end
