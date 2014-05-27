#
# Cript::Store
#
require 'pstore'
require 'cript/simple'

module Cript
  # Cript::Store provides the same functionality as PStore, except it encrypts
  # its data store on the file system.
  class Store < ::PStore

    # public_key_path
    # private_key_path
    #
    # public_key_content
    # public_key_path
    #
    # passphrase
    # thread_safe
    def initialize(file, opts = {})
      @opt = opts
      @cript = Cript::Simple.new(@opts)
      thread_safe = !!@opts.delete(:thread_safe)
      super(file, thread_safe)
    end

    def self.insecure(file, opts = {})
      new(file, opts.merge({ private_key_content: INSECURE_PRIVATE_KEY }))
    end

    def inspect
      "#<#{self.class.name} path=#{path}>"
    end

    private

    # :stopdoc:

    # encrypt
    def dump(table)
      @cript.encrypt(Marshal::dump(table))
    end

    # decrypt
    def load(content)
      Marshal::load(@cript.decrypt(content))
    end

    def marshal_dump_supports_canonical_option?
      false
    end

    EMPTY_MARSHAL_DATA = Marshal.dump({})
    EMPTY_MARSHAL_CHECKSUM = Digest::MD5.digest(EMPTY_MARSHAL_DATA)
    def empty_marshal_data
      EMPTY_MARSHAL_DATA
    end
    def empty_marshal_checksum
      EMPTY_MARSHAL_CHECKSUM
    end
  end
end
