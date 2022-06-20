require_relative './archive'

class ArchivePublic < Archive
  FILE_NAME = 'public'
  def initialize
    set_name(FILE_NAME)
  end

  def read
    file = File.open full_name
    decode file.read
  end

  def write(text)
    file = File.open(full_name, Archive::MODE_WRITE)
    file.puts encode text
    file.close
  end
end
