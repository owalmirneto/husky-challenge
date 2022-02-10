# frozen_string_literal: true

class FindUserByEmail < ApplicationInteractor
  def call
    context.user = User.find_or_initialize_by(email: context.email)
  end
end
