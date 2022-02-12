# frozen_string_literal: true

module ApplicationHelper
  def records_not_found(model)
    tag.div(class: 'alert alert-warning') do
      t('records.not_found', model: tm(model).downcase)
    end
  end
end
