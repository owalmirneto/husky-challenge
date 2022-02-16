# frozen_string_literal: true

module API
  class BaseController < ::ApplicationController
    private

    def record_not_found
      render json: { errors: [t('application.record_not_found')] },
             status: :not_found
    end

    def current_access_token
      @current_access_token ||= request.headers['Authorization-Token']
    end
  end
end
