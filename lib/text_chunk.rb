# Biblioteca disponibilizada pelo professor para a impletemetação

class TextChunk
    def initialize(n)
        case n
        when String
            @stringVal = n
        when Numeric
            @stringVal = numericToString(n)
        end
    end

    def numericToString(n)
        strVal = ""
        if n == 0
            strVal = "0"
        else
            while n > 0
                ans = n.divmod(256)
                charNum = ans[1]
                strVal += charNum.chr
                n = ans[0]
            end
        end
        return strVal
    end

    def to_s
        return @stringVal
    end

    def to_i
        result = 0

        @stringVal.reverse.split('').each{ | c |
            result = result * 256
            result += c.ord
        }

        return result
    end

    def self.block_size(n)
        block_size = 0
        temp = n - 1
        while temp > 1
            temp = temp / 2
            block_size += 1
        end

        return block_size / 8
    end
    
end