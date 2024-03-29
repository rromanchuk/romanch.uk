class ValidateUserClaims < Service
  attr_reader :claims

  let(:jwt_headers) { claims.split('.')[0] }
  let(:decoded_jwt_headers) { Base64.decode64(jwt_headers) }
  let(:decoded_json) { JSON.parse(decoded_jwt_headers) }

  let(:kid) { decoded_json['kid'] }
  let(:url) { "https://public-keys.auth.elb.us-east-1.amazonaws.com/#{kid}" }
  let(:pub_key) { Faraday.get(url).body }

  # x-amzn-oidc-data is a JWT token that contains the user's claims.
  def initialize(claims)
    super()
    @claims = claims
  end

  def call
    return false unless claims.present?

    JWT.decode claims, pub_key, nil, { algorithm: 'ES256' }
  end
end
