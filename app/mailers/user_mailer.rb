# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def created
    @user = params[:user]

    mail(to: @user.email)
  end
end
