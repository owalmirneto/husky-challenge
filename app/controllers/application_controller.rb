# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authenticable

  helper_method :current_user, :user_signed_in?
end
