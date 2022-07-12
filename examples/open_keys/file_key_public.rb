require_relative './files'

class FileKeyPublic < File
    attr_accessor :name
    KEY_N = 0
    KEY_E = 1
    
    def initialize(path)
        super(path)
    end
  
    def read
        text = super
        array_keys = text.split
        { key_n: array_keys[KEY_N].to_i, key_e: array_keys[KEY_E].to_i }
    end
end