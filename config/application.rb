# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HuskyChallenge
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.encoding = 'utf-8'

    # TimeZone
    #
    config.time_zone = ActiveSupport::TimeZone.new('America/Recife')
    config.active_record.default_timezone = :local

    # Load I18n configuration for locales
    #
    config.i18n.enforce_available_locales = true
    config.i18n.available_locales = ['en', 'pt-BR']
    config.i18n.default_locale = 'pt-BR'
    config.i18n.load_path +=
      Dir[Rails.root.join('config/locales/**/*.{rb,yml}').to_s]

    # Generators
    #
    config.generators do |generator|
      generator.orm :active_record, primary_key_type: :uuid
      generator.test_framework :rspec
      generator.helper_specs false
      generator.helper false
      generator.assets false
      generator.fixture_replacement :factory_bot, dir: 'spec/factories'
    end

    config.active_job.queue_adapter = :sidekiq
  end
end
