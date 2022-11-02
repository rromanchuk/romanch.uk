if Rails.env.development?
  creds = Aws::Credentials.new(Credentials.dig(:development, :aws, :aws_access_key_id),
                               Credentials.dig(:development, :aws, :aws_secret_access_key))
  Aws.config.update({credentials: creds, region: 'us-east-1'})
end