module ApplicationHelper
  include Pagy::Frontend

  def config = Rails.configuration.general
  def asset_exists?(path) = Rails.application.assets.resolve(path).present?

  def style_tags
    ['application', *content_for(:styles)&.split(',')]
  end
end
