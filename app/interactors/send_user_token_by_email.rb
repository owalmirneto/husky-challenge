# frozen_string_literal: true

class SendUserTokenByEmail < ApplicationInteractor
  def call
    UserMailer.with(user: context.user).created.deliver_later
  end
end
