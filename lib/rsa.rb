require 'json'
require_relative 'mathematics'
require_relative './text_chunk'
require_relative './archive_private'
require_relative './archive_public'
require_relative './archive_private_open'
require_relative './archive_public_open'
require_relative './message_compile'


module RSA
  module OPEN
    
    class Private
      attr_accessor :d, :n

      def self.n=(n)
        @n=n
      end

      def self.d=(d)
        @d=d
      end
      
      def self.n
        @n
      end

      def self.d
        @d
      end
    end

    class Public
      attr_accessor :e, :n

      def self.n=(n)
        @n=n
      end

      def self.e=(e)
        @e=e
      end

      def self.n
        @n
      end

      def self.e
        @e
      end
    end
  end

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
      private_key_file.write keys
    end

    def create_file(archive)
      key_n = @key_p * @key_q
      archive.write [key_n, @key_d]
    end

    private

    def generated_p_and_q
      @key_p = Mathematics.random_prime
      @key_q = Mathematics.random_prime
    end

    def generated_totiente_n
      @totiente_n = Mathematics.func_totiente_n(@key_p, @key_q)
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
      public_key_file.write keys
    end

    def create_file(archive)
      archive.write [@key_n, @e]
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

    private.create_file_of_keys
    public.create_file_of_keys
  end

  def self.generated_open_keys
    private = RSA::Private.new
    public = RSA::Public.new(private: private)

    private.create_file(ArchivePrivateOpen.new)
    public.create_file(ArchivePublicOpen.new)
  end

  def self.encode(menssage)
    e = nil
    n = nil

    if RSA::OPEN::Public.e && RSA::OPEN::Public.n
      e = RSA::OPEN::Public.e
      n = RSA::OPEN::Public.n
    else
      archive_public = ArchivePublic.new
      file = archive_public.read
      e = file[:e].to_i
      n = file[:key_n].to_i
    end
    chunk_size = TextChunk.block_size(n)
    split_in_regex = /.{1,#{chunk_size}}/

    pre_compile = MessageCompile.pre_compile(menssage)
    array_chunk = pre_compile.scan(split_in_regex)
    array_chunk.map { |chunk| 
      TextChunk.new(chunk).to_i.mod_pow(e, n) 
    }
  end

  def self.decode(menssage_encode)  
    d = nil
    n = nil

    if RSA::OPEN::Private.d && RSA::OPEN::Private.n
      d = RSA::OPEN::Private.d
      n = RSA::OPEN::Private.n
    else
      archive_private = ArchivePrivate.new
      private_file = archive_private.read
      d = private_file[:key_d].to_i
      n = private_file[:key_p].to_i * private_file[:key_q].to_i
    end

    menssage_decode = menssage_encode.map { |block|
      original_chunk = block.to_i.mod_pow(d, n)
      TextChunk.new(original_chunk).to_s
    }.join

    MessageCompile.back_pre_compile(menssage_decode)
  end
end