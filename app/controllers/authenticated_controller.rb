# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  before_action :authenticate_user!

  private

  def authenticate_user!
    return if user_signed_in?

    redirect_to(new_tokens_path, notice: t('authenticated.unauthorized_access'))
  end
end
