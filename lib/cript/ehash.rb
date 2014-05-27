#
# Cript::Hash
#
module Cript
  # A hash backed by a Cript::Store object.
  # All methods sent to an instance of this object are
  # wrapped in a transaction and executed immediately.
  class EHash

    METHODS = Hash.new.methods - Object.new.methods
    KEY = :data

    def initialize(file, opts = {})
      @store = Store.new(file, opts)
      @store.transaction do
        unless @store[KEY].is_a?(Hash)
          @store[KEY] = {}
        end
      end
    end

    def self.insecure(file, opts = {})
      new(file, opts.merge({ private_key_content: INSECURE_PRIVATE_KEY }))
    end

    def inspect
      "#<#{self.class.name} path='#{@store.path}'>"
    end

    def method_missing(sym, *args, &block)
      super if !METHODS.include?(sym) || block_given?

      @store.transaction do
        @store[KEY].send(sym, *args)
      end
    end

    def respond_to_missing?(sym, include_private = false)
      METHODS.include?(sym) || super
    end

  end
end
