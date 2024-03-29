# frozen_string_literal: true

module FeatureHelpers
  include TranslationHelper

  def random_uuid
    SecureRandom.uuid
  end

  def submit_form_filter(button_name, attributes)
    attributes.each { |attribute, value| fill_in(attribute, with: value) }

    click_button(button_name)
  end

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

  def json_body
    return {} if response_body.blank?

    @json_body ||= JSON.parse(response_body, symbolize_names: true)
  rescue JSON::ParserError
    {}
  end

  def response_body
    @response_body ||= response.body
  end
end
