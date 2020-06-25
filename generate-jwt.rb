require 'openssl'
require 'jwt'

puts JWT.encode({
  iat: Time.now.to_i,
  exp: Time.now.to_i + (10 * 60),
  iss: ENV['APP_ID']
}, OpenSSL::PKey::RSA.new(ENV['PRIVATE_KEY']), 'RS256')