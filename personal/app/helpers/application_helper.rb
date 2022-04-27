module ApplicationHelper
  include Pagy::Frontend
  
  def config() = Rails.configuration.general


  def style_tags
    ["application", *content_for(:styles)&.split(',')]
  end
end
