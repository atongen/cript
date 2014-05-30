require 'spec_helper'
require 'cript/naive'

describe Cript::Naive do
  let(:naive) do
    Cript::Simple.new({
      private_key_content: Cript::INSECURE_PRIVATE_KEY
    })
  end
  let(:small_data) { SecureRandom.random_bytes }
  let(:big_data) { SecureRandom.random_bytes(102400) }

  it 'should echo small data' do
    naive.echo(small_data).should eql(small_data)
  end

  it 'should echo big data' do
    naive.echo(big_data).should eql(big_data)
  end
end
