# frozen_string_literal: true

shared_context 'when api user logged' do
  let(:current_user) { create(:user) }

  let(:authorized_headers) do
    { 'Authorization-Token' => current_user.access_token }
  end

  let(:unauthorized_headers) do
    { 'Authorization-Token' => random_uuid }
  end
end
