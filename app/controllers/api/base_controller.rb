# frozen_string_literal: true

module API
  class BaseController < ::ApplicationController
    before_action :api_authenticate!

    private

    def api_authenticate!
      return if current_user.present?

      render json: { errors: [I18n.t('application.api.unauthorized')] },
             status: :unauthorized
    end

    def record_not_found
      render json: { errors: [t('application.record_not_found')] },
             status: :not_found
    end

    def current_access_token
      @current_access_token ||= request.headers['Authorization-Token']
    end
  end
end
