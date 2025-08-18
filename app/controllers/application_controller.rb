
# ApplicationController serves as the base controller for the application,
# providing shared functionality and configuration for all controllers.
#
# Includes:
# - Authentication: Handles user authentication logic.
# - Lettable: Extends controller with custom let methods.
# - Pagy::Backend: Adds pagination support.
#
# Layout:
# - Uses "ryan_romanchuk/application" layout for rendering views.
#
# Helper Methods:
# - breadcrumbs: Returns the current breadcrumbs array.
# - breadcrumbs?: Checks if any breadcrumbs are present.
#
# Authorization:
# - Authorizes actions based on the current user.
#
# Callbacks:
# - before_action :set_sentry_context: Sets Sentry context for error tracking.
#
# Breadcrumbs Management:
# - add_breadcrumb(name, url): Adds a breadcrumb to the navigation trail.
# - set_breadcrumbs: Initializes breadcrumbs with the home link.
#
# Current User:
# - current_user: Returns the currently logged-in user.
#
# Request Information:
# - request_id: Returns the unique request ID.
# - client_ip: Returns the client's IP address from headers.
# - user_agent: Returns the client's user agent string.
#
# Sentry Integration:
# - set_sentry_context: Sets user and request info for Sentry error tracking.
class ApplicationController < ActionController::Base
  include Authentication
  extend Lettable
  include Pagy::Backend
  layout "ryan_romanchuk/application"

  helper_method :breadcrumbs, :breadcrumbs?
  authorize :user, through: :current_user
  before_action :set_sentry_context

  # Breadcrumbs
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

  # Current user
  def current_user = RyanRomanchuk::Current.user

  # Request info
  def request_id = request.request_id
  def client_ip = request.headers['true-client-ip']
  def user_agent = request.headers['User-Agent']

  # Sentry context
  def set_sentry_context
    Sentry.set_user(
      id: current_user&.id,
      email_address: current_user&.email_address,
      ip_address: client_ip
    )
  end
end
