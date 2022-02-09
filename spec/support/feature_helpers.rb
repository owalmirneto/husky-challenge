# frozen_string_literal: true

module FeatureHelpers
  def have_content(string)
    super(string.to_s)
  end

  def translate(key, **options)
    I18n.t(key, **options)
  end
  alias t translate
end
