require_relative './archive'

class ArchivePrivateOpen < Archive
  FILE_NAME = 'private'
  def initialize
    set_name(FILE_NAME)
  end

  def read
    file = File.open full_name
    file
  end

  def write(text)
    file = File.open(full_name, Archive::MODE_WRITE)
    file.puts text
    file.close
  end
end
