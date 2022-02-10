# frozen_string_literal: true

describe 'sessions/new' do
  before do
    assign(:user, user)

    render
  end

  let(:user) { build(:user) }

  it 'renders page title' do
    expect(rendered).to have_css('h1', text: t('sessions.new.title'))
  end

  it 'renders new session form' do
    assert_select 'form[action=?][method=?]', sessions_path, 'post' do
      assert_select 'input[name=?]', 'session[access_token]'
    end
  end
end
