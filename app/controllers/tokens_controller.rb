# frozen_string_literal: true

class TokensController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if organizer.success?
      session[:current_access_token] = organizer.user.access_token

      redirect_to(invoices_path, notice: t('.success'))
    else
      @user = organizer.user
      render :new
    end
  end

  private

  def organizer
    @organizer ||= GenerateTokenByEmailOrganizer.call(token_params)
  end

  def token_params
    params.require(:token).permit(:email)
  end
end
