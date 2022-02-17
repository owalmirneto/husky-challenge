# frozen_string_literal: true

Rails.application.configure do
  config.i18n.raise_on_missing_translations = true unless Rails.env.production?
end
