require 'openssl'
require 'jwt'

private_key = ENV.fetch('PRIVATE_KEY')
app_id = ENV.fetch('APP_ID')

puts JWT.encode({
  iat: Time.now.to_i,
  exp: Time.now.to_i + (10 * 60),
  iss: app_id
}, OpenSSL::PKey::RSA.new(private_key), 'RS256')