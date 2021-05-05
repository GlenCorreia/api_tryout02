class AuthenticationTokenService
  HMAC_SECRET = 'sdfasdf'

  def self.call
    payload = {
      "test" => "blah"
    } 

    JWT.encode payload, HMAC_SECRET, 'HS265'
  end
end