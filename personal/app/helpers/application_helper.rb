module ApplicationHelper
  include Pagy::Frontend

  def my_config() = Rails.configuration.general
  

  def style_tags
    ['application', *content_for(:styles)&.split(',')]
  end

  def active_class(path)
    'active' if current_page?(path)
  end
end
