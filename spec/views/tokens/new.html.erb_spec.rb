# frozen_string_literal: true

describe 'tokens/new' do
  before do
    assign(:user, user)

    render
  end

  let(:user) { build(:user) }

  it 'renders page title' do
    expect(rendered).to have_css('h1', text: t('tokens.new.title'))
  end

  it 'renders new token form' do
    assert_select 'form[action=?][method=?]', tokens_path, 'post' do
      assert_select 'input[name=?]', 'token[email]'
    end
  end
end
