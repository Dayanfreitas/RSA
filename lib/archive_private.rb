require_relative './archive'

class ArchivePrivate < Archive
  FILE_NAME = 'private'
  def initialize
    set_name(FILE_NAME)
  end

  def read
    file = File.open full_name
    JSON.parse(decode(file.read), symbolize_names: true)
  end

  def write(text)
    file = File.open(full_name, Archive::MODE_WRITE)
    file.puts encode JSON.generate text
    file.close
  end
end
