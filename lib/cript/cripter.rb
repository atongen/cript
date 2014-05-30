#
# Cript::Cripter
#
require 'openssl'
require 'base64'

module Cript
  # Cript::Cripter is an abstract class for encryption implementations using RSA keys.
  class Cripter

    class Error < StandardError; end

    # Build a new cripter
    #
    # opts:
    # public_key_content
    # private_key_content
    # public_key_path
    # private_key_path
    # passphrase
    def initialize(opts = {})
      @opts = opts

      # Attempt to use the private key at the default location
      # if exists and not otherwise specified
      unless [:private_key_content, :private_key_path].any? { |o| @opts[o] }
        if File.file?("#{ENV['HOME']}/.ssh/id_rsa")
          @opts[:private_key_path] = "#{ENV['HOME']}/.ssh/id_rsa"
        end
      end

      if @opts[:private_key_content]
        @private_key = OpenSSL::PKey::RSA.new(*[@opts[:private_key_content], @opts.delete(:passphrase)])
      elsif @opts[:private_key_path] && File.file?(@opts[:private_key_path])
        @private_key = OpenSSL::PKey::RSA.new(*[File.read(@opts[:private_key_path]), @opts.delete(:passphrase)])
      end

      if @private_key
        @public_key = @private_key.public_key
      else
        if @opts[:public_key_content]
          @public_key = OpenSSL::PKey::RSA.new(@opts[:public_key_content])
        elsif @opts[:public_key_path] && File.file?(@opts[:public_key_path])
          @public_key = OpenSSL::PKey::RSA.new(File.read(@opts[:public_key_path]))
        elsif File.file?("#{ENV['HOME']}/.ssh/id_rsa.pub")
          @public_key = OpenSSL::PKey::RSA.new(File.read("#{ENV['HOME']}/.ssh/id_rsa.pub"))
        end
      end
    end

    def inspect
      "#<#{self.class.name}>"
    end

    def encrypt(message)
      raise Cript::Cripter::Error, "Implement me"
    end

    def decrypt(message)
      raise Cript::Cripter::Error, "Implement me"
    end

    def echo(message)
      decrypt(encrypt(message))
    end

  end
end
