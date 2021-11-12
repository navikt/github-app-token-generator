# frozen_string_literal: true

require 'openssl'
require 'jwt'

private_key = ENV.fetch('PRIVATE_KEY')
app_id = ENV.fetch('APP_ID')

payload = {
  iat: Time.now.to_i,
  exp: Time.now.to_i + (10 * 60),
  iss: app_id
}

puts JWT.encode(payload, OpenSSL::PKey::RSA.new(private_key), 'RS256')
