# frozen_string_literal: true

module LinkToHelper
  PREFIX_BUTTON_CLASS = 'btn btn-sm btn-outline-'

  def link_to_new(resource, url)
    text = t('link_to.links.new', model: tm(resource).downcase)

    link_to(text, url, default_html_options(text, 'primary'))
  end

  def link_to_back(url)
    text = t('link_to.links.back')

    link_to(text, url, default_html_options(text, 'dark'))
  end

  def link_to_show(url)
    text = t('link_to.links.show')

    link_to(text, url, default_html_options(text, 'secondary'))
  end

  def link_to_destroy(url)
    text = t('link_to.links.destroy')

    button_to(text, url, default_html_options(text, 'danger', method: :delete))
  end

  def default_html_options(text, button_type, html_options = {})
    {
      title: strip_tags(text),
      class: button_class(button_type, html_options[:class])
    }.merge(html_options)
  end

  def button_class(type, addicional_class = nil)
    "#{PREFIX_BUTTON_CLASS}#{type} #{addicional_class}".strip
  end
end
