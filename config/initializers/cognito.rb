# CognitoTokenVerifier.configure do |config|
#   config.aws_region = 'us-east-1'
#   config.user_pool_id = Credentials[:cognito_user_pool]
#   config.token_use = 'id' # acceptable options are 'id' and 'access'; can be an array for both options - defaults to allowing either cognito token type
# end