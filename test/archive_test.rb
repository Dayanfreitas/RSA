require 'test/unit'
require_relative '../lib/archive'

class ArchiveTest < Test::Unit::TestCase
  def test_default_constants
    assert_equal(Archive::ROOT_PATH_FILE, './')
    assert_equal(Archive::EXTENSION_FILE, '.txt')
  end

  def test_default_attributes
    assert_equal(Archive.new.name, nil, 'Name default archive is nil')
  end

  def test_set_attributes
    archive = Archive.new
    archive.set_name('name_teste')
    assert_equal(archive.name, 'name_teste', 'Name set')
  end

  def test_read
    assert_raise("Not implement") { Archive.new.read }
  end

  def test_write
    assert_raise("Not implement") { Archive.new.write }
  end
end