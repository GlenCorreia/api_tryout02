class AuthenticationTokenService
  HMAC_SECRET = 'sdfasdf'
  ALGORITHM_TYPE = 'HS265'

  def self.call
    payload = {
      "test" => "blah"
    } 

    JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE
  end
end