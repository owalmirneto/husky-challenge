# frozen_string_literal: true

module Authenticable
  extend ActiveSupport::Concern

  included do
    private

    def user_signed_in?
      current_user.present?
    end

    def current_user
      @current_user ||= User.find_by(access_token: current_access_token)
    end

    def current_access_token
      @current_access_token ||= session[:current_access_token]
    end
  end
end
