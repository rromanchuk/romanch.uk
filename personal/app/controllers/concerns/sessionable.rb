module Sessionable
  extend ActiveSupport::Concern
  included do
    helper_method :current_user, :require_me!, :logout!, :require_user!
  end

  def current_user
    return @current_user if instance_variable_defined?(:@current_user)

    find_by_session || find_by_alb
  end

  def require_me!
    not_authorized_error unless current_user&.cognito_id == '54467d4a-f7bc-457d-aa72-55842106b02e'
  end

  def require_user!
    not_authorized_error unless current_user
  end

  def not_authorized_error
    session[:original_request] = request.original_url

    logout!
    respond_to do |format|
      format.html { redirect_to("#{config.auth_url}/login?response_type=code&client_id=#{Credentials[:cognito_client]}&redirect_uri=#{config.cognito_redirect}", allow_other_host: true) and return }
    end
  end

  def find_by_session
    return nil unless session[:user_id]
    
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
    session[:amzn_oidc_identity] = user.cognito_id
  end

  def logout!
    cookies.delete '_alb_personal'
    session[:user_id] = nil
  end
end