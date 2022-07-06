require "base64"

class Archive
  ROOT_PATH_FILE = "./"
  EXTENSION_FILE = ".txt"
  MODE_WRITE = "w"
  FILE_PATH_KEYS="keys"

  attr_reader :name, :path

  def read
    raise "Not implement"
  end

  def write
    raise "Not implement"
  end

  def set_name(name)
    @name = name
  end

  def full_name
    if FILE_PATH_KEYS
      Dir.mkdir(FILE_PATH_KEYS) unless Dir.exist?(FILE_PATH_KEYS)
    end

    "#{ FILE_PATH_KEYS + '/' if FILE_PATH_KEYS}#{@name || 'text'}#{EXTENSION_FILE}"
  end

  def encode(string)
    Base64.encode64(string)
  end

  def decode(string)
    Base64.decode64(string)
  end
end
