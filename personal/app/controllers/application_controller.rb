class ApplicationController < ActionController::Base
  extend Lettable
  include Sessionable
  include Pagy::Backend

  helper_method :amzn_oidc_data, :amzn_oidc_identity, :breadcrumbs, :breadcrumbs?, :breadcrumbs_to_s

  rescue_from ActionPolicy::Unauthorized do |ex|
    ap ex.result.all_details
    ap ex.result
    if ex.result.all_details[:not_found]
      raise ActionController::RoutingError, 'Not Found'
    else
      not_authorized_error
    end
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

  # move to decorator
  def breadcrumbs_to_s
    breadcrumbs.map(&:name).join(' | ')
  end

  def add_breadcrumb(name, path = nil)
    breadcrumbs << Breadcrumb.new(name, path)
  end
end
