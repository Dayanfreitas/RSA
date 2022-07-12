require 'test/unit'
require_relative '../lib/rsa'

class RSATest < Test::Unit::TestCase
  def setup
    RSA.generated
    RSA::OPEN::Public.n = nil
    RSA::OPEN::Public.e = nil
    RSA::OPEN::Private.d = nil
    RSA::OPEN::Private.n = nil
   
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

  def test_encode_open
    RSA::OPEN::Public.n = 15212890864824009557
    RSA::OPEN::Public.e = 101
    assert_instance_of Array.class, RSA.encode("hello world !").class,  "Mensagem codificada com chaves abertas"
  end
  
  def test_decode_open
    RSA::OPEN::Private.d = 3163076316033238841
    RSA::OPEN::Private.n = 15212890864824009557
   
    assert_equal "hello world !", RSA.decode([2352154520049881769, 5108660683496590109, 1510079240960426942]) , "Mensagem decodificada com chaves abertas"
  end 
end