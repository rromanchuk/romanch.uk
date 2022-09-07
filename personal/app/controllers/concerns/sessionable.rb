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
    not_authorized_error unless me?
  end

  def require_user!
    not_authorized_error unless current_user
  end

  def not_authorized_error
    session[:original_request] = request.original_url
    if Rails.env.development?
      redirect_to(oauth_cognito_authorize_path)
      return
    end

    redirect_to(login_path) and return
  end

  def find_by_session
    return nil unless session[:user_id]

    User.find_by(id: session[:user_id])&.tap do |user|
      set_current_user(user)
    end
  end

  def find_by_alb
    return nil unless amzn_oidc_identity
    return nil unless ValidateUserClaims.call(amzn_oidc_data)

    User.create_with({}).find_or_create_by!(cognito_id: amzn_oidc_identity).tap do |user|
      set_current_user(user)
    end
  end

  def me?
    return false if current_user.nil?

    current_user.me?
  end

  def set_current_user(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def logout!
    cookies.delete '_alb_personal'
    set_current_user(nil)
  end
end
