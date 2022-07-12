require 'base64'

class MessageCompile
  def self.pre_compile(message)
    Base64.encode64(message)
  end
  
  def self.back_pre_compile(message)
    Base64.decode64(message)
  end
end
