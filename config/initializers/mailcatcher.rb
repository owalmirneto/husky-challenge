# frozen_string_literal: true

Rails.application.configure do
  if Rails.env.development?
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = { address: '127.0.0.1', port: 1025 }
    config.action_mailer.raise_delivery_errors = false
  end
end
