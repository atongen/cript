# Cript

Simple Encryption Tools for Ruby

[![Gem Version](https://badge.fury.io/rb/cript.png)](http://badge.fury.io/rb/cript)
[![Build Status](https://travis-ci.org/atongen/cript.png)](https://travis-ci.org/atongen/cript)

## Installation

Add this line to your application's Gemfile:

    gem 'cript'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cript

## Usage

### Cript::Store

Cript::Store builds on PStore from the standard library, but encrypts the data it writes
to the filesystem. By default it uses Cript::Simple to do the encryption.

```ruby
require 'cript'
store = Cript::Store.new('/tmp/cript.store')
store.transaction do
  store[:secret] = "Super secret data!"
end
```

### Cript::EHash

Cript::EHash is a convenience class that allows you to not explicitly declare transactions.
You can treat it like you would normally treat a hash.
Each message sent to the object automatically gets wrapped in a transaction block.
Obviously, this will have performance implications.

### Cript::Simple

Cript::Simple is a simple wrapper around the ruby openssl bindings.
Once created, you can call encrypt or decrypt on it to encrypt or decrypt strings.
It requires access to an RSA public key to do encryption, and an RSA private key to do decryption.
If not provided at initialization, it will look in $HOME/.ssh/id_rsa and $HOME/.ssh/id_rsa.pub.

If you don't want to use your default ssh keys, you can pass in paths to a different key pair.

```ruby
c1 = Cript::Simple.new(public_key_path: '/path/to/some/ssh_key.pub', private_key_path: '/path/to/some/ssh_key')
plain = "More secret stuff!"
encrypted = c2.encrypt(plain)
decrypted = c2.decrypt(encrypted)
```

Or you can pass in the ssh keys as strings in PEM format:

```ruby
c2 = Cript::Simple.new({
  public_key_content: "-----BEGIN PUBLIC KEY-----\nafaf...",
  private_key_path: "-----BEGIN RSA PRIVATE KEY-----\n3f4q..."
})
encrypted = c.encrypt("More secret stuff!")
```

You can use Cript::Simple from bash with the `cript` executable.
Type `cript --help` after gem installation for usage.

## TODO

- [ ] plugable encryption
- [ ] gpg encryption
- [ ] plugable storage
- [ ] ssh storage
- [ ] s3 storage
- [ ] google drive storage
- [ ] drb storage

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
