# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true
  validates :access_token, presence: true
end
