class ApplicationController < ActionController::Base
  extend Lettable
  include Sessionable
  include Pagy::Backend

  helper_method :amzn_oidc_data, :amzn_oidc_identity, :breadcrumbs, :breadcrumbs?
  before_action :set_sentry_context

  rescue_from ActionPolicy::Unauthorized do |ex|
    ap ex.result.all_details
    ap ex.result
    if ex.result.all_details[:not_found]
      raise ActionController::RoutingError, 'Not Found'
    else
      not_authorized_error
    end
  end

  def url_options
    { host: Rails.configuration.general.romanchuk_host }.merge(super)
  end

  private

  def request_id = request.request_id
  def client_ip = request.headers['true-client-ip']
  def user_agent = request.headers['User-Agent']
  def my_config = Rails.configuration.general
  def asset_exists?(path) = Rails.application.assets.resolve(path).present?
  # ALB injected headers indicating authenticated user
  def amzn_oidc_identity = request.headers['x-amzn-oidc-identity']
  def amzn_oidc_data = request.headers['x-amzn-oidc-data']

  def append_info_to_payload(payload)
    super
    payload[:remote_ip] = client_ip
    payload[:ua] = user_agent
    payload[:request_id] = request_id
    payload[:user_id] = session[:user_id] || :guest
    payload[:url] = request.original_url
    payload[:hostname] = HOSTNAME
    payload[:host] = request.host
    payload[:amzn_oidc_identity] = amzn_oidc_identity
  end

  def iid
    cookies[:iid].presence
  end

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

  def set_sentry_context
    Sentry.set_user(
      {
        id: current_user&.id,
        username: current_user&.username,
        ip_address: client_ip
      }
    )
  end
end
