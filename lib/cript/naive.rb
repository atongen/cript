#
# Cript::Naive
#
require 'openssl'
require 'base64'

module Cript
  # Cript::Naive uses rsa keys to encrypt data.
  # It allows you to easily encrypt and decrypt strings.
  # Performance is poor because rsa public keys were not meant to do this.
  class Naive < Cripter

    def encrypt(message)
      Base64::encode64(
        message.
        bytes.
        each_slice((size / 8) - 11).
        map { |chunk| @public_key.public_encrypt(chunk.pack('C*')) }.
        join)
    end

    def decrypt(message)
      Base64::decode64(message).
        bytes.
        each_slice(size / 8).
        map { |chunk| @private_key.private_decrypt(chunk.pack('C*')) }.
        join
    end

  end
end
