# frozen_string_literal: true

module RoutesAndHelpers
  def helpers
    @helpers ||= ApplicationController.helpers
  end
  alias h helpers

  def url_helpers
    @url_helpers ||= Rails.application.routes.url_helpers
  end
  alias r url_helpers
end
