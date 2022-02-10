# frozen_string_literal: true

class GenerateTokenByUser < ApplicationInteractor
  delegate :user, to: :context

  def call
    context.fail! unless user.update(user_params)
  end

  private

  def user_params
    { access_token: random_access_token }
  end

  def random_access_token
    SecureRandom.urlsafe_base64
  end

  def error_messages
    user.errors.full_messages.to_sentence
  end
end
