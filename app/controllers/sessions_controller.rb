# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :set_user, only: :create

  def new
    @user = User.new
  end

  def create
    if @user.persisted?
      session[:current_access_token] = @user.access_token

      redirect_to(invoices_path, notice: t('.success'))
    else
      redirect_to(new_sessions_url, notice: t('.failure'))
    end
  end

  def show
    if User.exists?(access_token: params[:id])
      session[:current_access_token] = params[:id]

      redirect_to(invoices_path, notice: t('.success'))
    else
      redirect_to(new_sessions_url, notice: t('.failure'))
    end
  end

  def destroy
    session.delete(:current_access_token)

    redirect_to(new_sessions_path)
  end

  private

  def set_user
    @user = User.find_or_initialize_by(access_token: session_params[:access_token])
  end

  def session_params
    params.require(:session).permit(:access_token)
  end
end
