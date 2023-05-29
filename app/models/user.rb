# frozen_string_literal: true

class User < ApplicationRecord
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :email, presence: true, format: { with: EMAIL_REGEX }
  validates :access_token, presence: true
end
