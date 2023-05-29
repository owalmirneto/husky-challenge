# frozen_string_literal: true

require 'sidekiq/testing'

Sidekiq::Testing.inline!

RSpec.configure do |config|
  config.before do
    Sidekiq::Job.clear_all
  end
end
