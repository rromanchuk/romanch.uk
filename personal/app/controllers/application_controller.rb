class ApplicationController < ActionController::Base
  extend Lettable

  layout 'blog'

  delegate :request_id, to: :request
  def amzn_oidc_identity() = request.headers['x-amzn-oidc-identity']
  def amzn_oidc_data() = request.headers['x-amzn-oidc-data']
  def client_ip() = request.headers['true-client-ip']
  def user_agent() = request.headers['User-Agent']
  def config() = Rails.configuration.general

  def current_user
    return @current_user if instance_variable_defined?(:@current_user)

    find_by_session || find_by_alb
  end

  def find_by_session
    User.find_by(id: session[:user_id])&.tap do |user|
      set_current_user(user)
    end
  end

  def find_by_alb
    return nil unless amzn_oidc_identity
    
    User.create_with({}).find_or_create_by!(cognito_id: amzn_oidc_identity).tap do |user|
      set_current_user(user)
    end
  end

  def set_current_user(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def logout!
    cookies.delete '_alb_personal'
    session[:user_id] = nil
  end



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
