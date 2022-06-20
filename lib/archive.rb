require "base64"

class Archive
  ROOT_PATH_FILE = "./"
  EXTENSION_FILE = ".txt"
  MODE_WRITE = "w"

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
    "#{@name}#{EXTENSION_FILE}"
  end

  def encode(string)
    Base64.encode64(string)
  end

  def decode(string)
    Base64.decode64(string)
  end
end
