# frozen_string_literal: true

module FeatureHelpers
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
