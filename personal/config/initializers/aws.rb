if Rails.env.development?
  shared_creds = Aws::SharedCredentials.new(profile_name: 'ryan')
  Aws.config.update(credentials: shared_creds)
end