require 'test/unit'
require_relative '../lib/rsa'

class RSATest < Test::Unit::TestCase
  def test_is_module
    assert_instance_of(Module.class, RSA.class, 'RSA é um modulo')
  end
end