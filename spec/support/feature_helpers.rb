# frozen_string_literal: true

module FeatureHelpers
  include TranslationHelper

  def submit_model_form(model, attributes)
    prefix_name = model.to_s.underscore

    attributes.each do |attribute, value|
      fill_in("#{prefix_name}_#{attribute}", with: value)
    end

    click_button(submit_action_label(model))
  end

  def submit_action_label(model)
    t('helpers.submit.create', model: model.model_name.human)
  end

  def have_content(string)
    super(string.to_s)
  end

  def translate(key, **options)
    I18n.t(key, **options)
  end
  alias t translate
end
