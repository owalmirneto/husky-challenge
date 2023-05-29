# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def decorate
    ActiveDecorator::Decorator.instance.decorate(self)
  end
end
