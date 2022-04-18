module Sessionable
  extend ActiveSupport::Concern
  included do
    helper_method :current_user
  end

  def current_user
    return @current_user if instance_variable_defined?(:@current_user)

    find_by_session || find_by_alb
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
  end

  def logout!
    cookies.delete '_alb_personal'
    session[:user_id] = nil
  end
end