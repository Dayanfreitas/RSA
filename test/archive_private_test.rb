require 'test/unit'
require_relative '../lib/archive_private'
require_relative '../lib/rsa'

class ArchivePrivateTest < Test::Unit::TestCase
  def setup
    RSA.generated
  end

  def test_full_name
    archive_private = ArchivePrivate.new
    assert_equal('keys/private.txt', archive_private.full_name, 'private is name of file')
  end

  def test_read
    archive_private = ArchivePrivate.new
    assert_instance_of(File.class, archive_private.read.class, 'type of file')
  end

  def test_write
    archive_private = ArchivePrivate.new
    archive_private.write( "oi")
    assert_not_empty(archive_private.read, 'Write in file')
  end
end
