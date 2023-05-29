# frozen_string_literal: true

class ApplicationSerializer < ActiveModel::Serializer
  def object
    super.respond_to?(:decorate) ? super.decorate : super
  end
end
