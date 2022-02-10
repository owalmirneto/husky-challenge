# frozen_string_literal: true

describe 'layouts/_navbar' do
  before do
    ApplicationHelper.include(Authenticable)
    allow(view).to receive(:user_signed_in?).and_return(user_signed_in?)

    render
  end

  let(:user_signed_in?) { false }

  it 'have image logo' do
    expect(rendered).to have_css("img[src*='husky-logo']")
  end

  it 'have link to invoices' do
    expect(rendered).to have_link(t('layouts.navbar.invoices'), href: invoices_path)
  end

  context 'when user not logged' do
    it 'have link to login' do
      expect(rendered).to have_link(t('layouts.navbar.sign_in_by_token'), href: invoices_path)
    end

    it 'have link to generate access token' do
      expect(rendered).to have_link(t('layouts.navbar.generate_token'), href: new_tokens_path)
    end
  end

  context 'when user signed' do
    let(:user_signed_in?) { true }

    it 'have link to logout' do
      expect(rendered).to have_button(t('layouts.navbar.sign_out'))
    end
  end
end
