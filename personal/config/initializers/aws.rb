if Rails.env.development?
  sso_credentials = Aws::SSOCredentials.new(
    sso_account_id: '080383581145',
    sso_role_name: "AdministratorAccess",
    sso_region: "us-east-1",
    sso_start_url: 'https://rromanchuk.awsapps.com/start'
  )
  Aws.config.update(credentials: sso_credentials)
end