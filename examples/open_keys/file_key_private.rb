require_relative './files'

class FileKeyPrivate < File
    attr_accessor :name
    KEY_N = 0
    KEY_D = 1
    
    def initialize(path)
        super(path)
    end
  
    def read
        text = super
        array_keys = text.split
        { key_n: array_keys[KEY_N].to_i, key_d: array_keys[KEY_D].to_i }
    end
end