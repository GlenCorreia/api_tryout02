class AuthenticationTokenService
  def self.call
    hmac_secret = 'sdfasdf'
    payload = {
      "test" => "blah"
    } 

    JWT.encode payload, hmac_secret, 'HS265'
  end
end