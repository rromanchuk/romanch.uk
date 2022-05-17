class ApplicationController < ActionController::Base
  extend Lettable
  include Sessionable
  include Pagy::Backend


  layout 'blog'
  helper_method :amzn_oidc_data

  delegate :request_id, to: :request
  

  

  rescue_from ActionPolicy::Unauthorized do |ex|
    ap ex.result.all_details
    ap ex.result
    if ex.result.all_details[:not_found]
      raise ActionController::RoutingError.new('Not Found')
    else
      not_authorized_error
    end
  end

  private

  def client_ip = request.headers['true-client-ip']
  def user_agent = request.headers['User-Agent']
  def my_config() = Rails.configuration.general
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
    payload[:amzn_oidc_identity] = amzn_oidc_identity
  end
end
