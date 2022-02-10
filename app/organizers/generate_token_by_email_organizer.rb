# frozen_string_literal: true

class GenerateTokenByEmailOrganizer < ApplicationOrganizer
  organize FindUserByEmail, GenerateTokenByUser
end
