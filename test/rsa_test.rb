require 'test/unit'
require_relative '../lib/rsa'

class RSATest < Test::Unit::TestCase
  def setup
    RSA.generated
    @private_path_name = ArchivePrivate.new.full_name
    @public_path_name = ArchivePublic.new.full_name
  end

  def test_is_module
    assert_instance_of(Module.class, RSA.class, 'RSA é um modulo')
  end

  def test_generated_public
    assert File.exist?(@public_path_name), 'Arquivo foi criado'
  end

  def test_generated_private
    assert File.exist?(@private_path_name), 'Arquivo foi criado'
  end

  def test_encode
    RSA.generated
    assert_instance_of Array.class, RSA.encode('oi').class 
  end

  def test_decode
    RSA.generated
    assert_equal 'oi', RSA.decode(RSA.encode('oi'))
  end  
end