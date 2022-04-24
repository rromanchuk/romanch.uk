class ApplicationController < ActionController::Base
  extend Lettable
  include Sessionable
  include Pagy::Backend
  
  layout 'blog'

  delegate :request_id, to: :request
  # ALB injected headers indicating authenticated user
  def amzn_oidc_identity() = request.headers['x-amzn-oidc-identity']
  def amzn_oidc_data() = request.headers['x-amzn-oidc-data']
  
  def client_ip() = request.headers['true-client-ip']
  def user_agent() = request.headers['User-Agent']
  def config() = Rails.configuration.general

  
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
