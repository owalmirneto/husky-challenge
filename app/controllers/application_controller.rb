# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authenticable

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  helper_method :current_user, :user_signed_in?

  private

  def record_not_found
    redirect_back(fallback_location: root_path,
                  notice: t('application.record_not_found'))
  end
end
