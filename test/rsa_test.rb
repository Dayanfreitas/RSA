require 'test/unit'
require_relative '../../src//main'

class RSATest < Test::Unit::TestCase
  def test_is_module
    assert_instance_of(Module.class, RSA.class, 'RSA é um modulo')
  end
end