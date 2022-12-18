if Rails.env.development?
  creds = Aws::Credentials.new(Credentials[:aws_access_key_id],
                               Credentials[:aws_secret_access_key])
  Aws.config.update({credentials: creds, region: 'us-east-1'})
end