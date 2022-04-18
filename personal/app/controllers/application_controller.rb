class ApplicationController < ActionController::Base
  extend Lettable

  layout 'blog'

  def amzn_oidc_identity() = request.headers['x-amzn-oidc-identity']
  def amzn_oidc_data() = request.headers['x-amzn-oidc-data']
  def client_ip() = request.headers['true-client-ip']
    
end
