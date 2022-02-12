# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('.ruby-version').strip

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.1'
# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem 'propshaft'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'
# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem 'jsbundling-rails'
# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem 'cssbundling-rails'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

group :development, :test do
  # https://github.com/bkeepers/dotenv#rails
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
  # https://github.com/pry/pry-rails#usage
  gem 'pry-rails', '~> 0.3.9'
  # https://github.com/deivid-rodriguez/pry-byebug#commands
  gem 'pry-byebug', '~> 3.9'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'
  # https://github.com/presidentbeef/brakeman
  gem 'brakeman', '~> 5.2', require: false
  # https://github.com/rubocop-hq/rubocop-rails#usage
  gem 'rubocop-rails', '~> 2.13'
  # https://github.com/rubocop-hq/rubocop-performance#usage
  gem 'rubocop-performance', '~> 1.13'
  # https://github.com/backus/rubocop-rspec
  gem 'rubocop-rspec', '~> 2.8'
  # https://github.com/Shopify/erb-lint#installation
  gem 'erb_lint', '~> 0.1.1', require: false
  # https://github.com/ryanb/letter_opener#rails-setup
  gem 'letter_opener', '~> 1.7'
end

group :test do
  # https://github.com/rspec/rspec-rails#installation
  gem 'rspec-rails', '~> 5.1'
  # https://github.com/teamcapybara/capybara#setup
  gem 'capybara', '~> 3.36'
  # https://github.com/thoughtbot/factory_bot_rails
  gem 'factory_bot_rails', '~> 6.2'
  # https://github.com/stympy/faker
  gem 'faker', '~> 2.19'
  # https://github.com/SeleniumHQ/selenium
  gem 'selenium-webdriver', '~> 4.1'
  # https://github.com/titusfortner/webdrivers#usage
  gem 'webdrivers', '~> 5.0'
end

# https://github.com/heartcombo/simple_form#bootstrap
gem 'simple_form', '~> 5.1'
# https://github.com/collectiveidea/interactor#what-is-an-interactor
gem 'interactor', '~> 3.1'
# https://github.com/mperham/sidekiq/wiki/Getting-Started
gem 'sidekiq', '~> 6.4'
# https://github.com/owalmirneto/queries#usage
gem 'ows-queries', '~> 0.1.5'
# https://github.com/amatsuda/active_decorator#usage
gem 'active_decorator', '~> 1.4'
