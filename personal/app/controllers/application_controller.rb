
class ApplicationController < ActionController::Base
  include Authentication
  extend Lettable
  include Pagy::Backend
  layout "ryan_romanchuk/application"

  helper_method :breadcrumbs, :breadcrumbs?
  authorize :user, through: :current_user
  before_action :set_sentry_context


  def breadcrumbs
    @breadcrumbs ||= []
  end

  def breadcrumbs?
    breadcrumbs.any?
  end

  def add_breadcrumb(name, url = nil)
    breadcrumbs << Breadcrumb.new(name, url)
  end

  def set_breadcrumbs
    add_breadcrumb('Home', root_url)
  end
  
  def current_user
    RyanRomanchuk::Current.user
  end

  def request_id = request.request_id
  def client_ip = request.headers['true-client-ip']
  def user_agent = request.headers['User-Agent']


  def set_sentry_context
    Sentry.set_user(
      {
        id: current_user&.id,
        email_address: current_user&.email_address,
        ip_address: client_ip
      }
    )
  end
end
