require 'json'
require_relative 'mathematics'
require_relative './archive_private'
require_relative './archive_public'

module RSA
  class Private
    attr_reader :key_p, :key_q, :totiente_n, :key_d

    def initialize
      generated_p_and_q
      generated_totiente_n
    end

    def generated_d(e)
      number = 1
      until Mathematics.is_multiplicative_inverse?((number * e), @totiente_n)
        number += 1
      end

      @key_d = number
    end

    def create_file_of_keys
      private_key_file = ArchivePrivate.new
      private_key_file.write JSON.generate keys
    end

    def display_keys
      puts ""
      puts "==== PRIVATE  KEYS ===="
      puts @key_p
      puts @key_q
      puts @key_d
      puts @totiente_n
      puts "=== END PRIVATE KEYS ==="
    end

    private

    def generated_p_and_q
      @key_p = Mathematics.random_prime
      @key_q = Mathematics.random_prime
    end

    def generated_totiente_n
      # função totiente em n
      # 𝜑(𝑛) = (𝑝 − 1) ∗ (𝑞 − 1)
      @totiente_n = (@key_p - 1) * (@key_q - 1)
    end

    def keys
      {key_p: @key_p, key_q: @key_q, totiente_n: @totiente_n, key_d: @key_d}
    end
  end

  class Public
    attr_reader :key_n, :e

    def initialize(private:)
      generated(private)
      choice_e(private)
      private.generated_d(@e)
    end

    def create_file_of_keys
      public_key_file = ArchivePublic.new
      public_key_file.write JSON.generate(keys)
    end

    def display_keys
      puts ""
      puts "==== PUBLIC KEYS ===="
      puts @key_n
      puts @e
      puts "== END PUBLIC KEYS =="
    end

    private

    def keys
      {key_n: @key_n, e: @e}
    end

    def generated(private)
      @key_n = private.key_p * private.key_q
    end

    def choice_e(private)
      loop do
        random = random_e(private.totiente_n)

        if prime_to_each_other(random, private.totiente_n)
          @e = random
          break
        end
      end
    end

    def random_e(totiente_n)
      rand(totiente_n)
    end

    def prime_to_each_other(number, totiente_n)
      number.gcd(totiente_n) == 1
    end
  end

  def self.generated
    private = RSA::Private.new
    public = RSA::Public.new(private: private)

    private.display_keys
    private.create_file_of_keys

    public.display_keys
    public.create_file_of_keys
  end

  def self.encode(menssage)
    archive_public = ArchivePublic.new
    file = archive_public.read
    file = JSON.parse(file)

    e = file["e"].to_i
    n = file["key_n"].to_i

    menssage_pre_codify = menssage.bytes
    menssage_encode = menssage_pre_codify.map { |block|
      Mathematics.mod(Mathematics.pow(block, e), n)
    }
    menssage_encode
  end

  def self.decode(menssage_encode)
    archive_private = ArchivePrivate.new
    private_file = archive_private.read
    private_file = JSON.parse(private_file)

    d = private_file["key_d"].to_i
    n = private_file["key_p"].to_i * private_file["key_q"].to_i

    menssage_decode = menssage_encode.map { |block|
      Mathematics.mod(Mathematics.pow(block, d), n)
    }

    menssage_decode
    menssage_decode.pack('C*').force_encoding('UTF-8')
  end
end
