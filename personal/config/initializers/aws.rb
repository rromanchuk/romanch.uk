if Rails.env.development?
  shared_creds = Aws::SharedCredentials.new(profile_name: 'Ryan-Administrator')
  Aws.config.update(credentials: shared_creds)
end