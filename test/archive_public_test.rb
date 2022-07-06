require 'test/unit'
require_relative '../lib/archive_public'

class ArchivePublicTest < Test::Unit::TestCase
  def test_full_name
    archive_public = ArchivePublic.new
    assert_equal('keys/public.txt', archive_public.full_name, 'private is name of file')
  end

  def test_read
    archive_public = ArchivePublic.new
    assert_instance_of(File.class, archive_public.read.class, 'type of file')
  end

  def test_write
    archive_public = ArchivePublic.new
    archive_public.write("oi")
    assert_not_empty(archive_public.read, 'Write in file')
  end
end