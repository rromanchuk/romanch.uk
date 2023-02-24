require 'aws-sdk-secretsmanager'

def get_secret
  client = Aws::SecretsManager::Client.new(region: 'us-east-1')

  begin
    get_secret_value_response = client.get_secret_value(secret_id: 'rds!db-a7f17a66-f4c2-423b-b3ea-e18c226b1cfe')
  rescue StandardError => e
    # For a list of exceptions thrown, see
    # https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_GetSecretValue.html
    raise e
  end

  secret = get_secret_value_response.secret_string
  secret_hash = JSON.parse(secret)
  ENV['DATABASE_USERNAME'] = secret_hash['username']
  ENV['DATABASE_PASSWORD'] = secret_hash['password']
end

