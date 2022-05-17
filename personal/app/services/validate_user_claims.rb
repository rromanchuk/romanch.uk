class ValidateUserClaims < Base
  attr_reader :claims

  let(:jwt_headers) { claims.split('.')[0] }
  let(:decoded_jwt_headers) { Base64.decode64(jwt_headers) }
  let(:decoded_json) { JSON.parse(decoded_jwt_headers) }

  let(:kid) { decoded_json['kid'] }
  let(:url) { "https://public-keys.auth.elb.us-east-1.amazonaws.com/#{kid}" }
  let(:pub_key) { Faraday.get(url).body }

  def initialize(claims)
    super()
    @claims = claims
  end

  def call
    return false unless claims.present?

    JWT.decode encoded_jwt, pub_key, nil, { algorithm: 'ES256' }
  end
end
