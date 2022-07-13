require 'prime'

class Integer
  def mod_pow(exp, mod)
    result = 1
    base = self
    while exp > 0
        if (exp & 1) == 1
           result = (result * base) % mod
        end
        exp = exp >> 1
        base = (base * base) % mod
    end
    
    result
  end
end

class Mathematics
  LIMIT = 10000
  @number_primes = Prime.each(LIMIT).to_a

  def self.random_prime
    number_random = rand(@number_primes.length)
    @number_primes[number_random]
  end

  def self.pow(n, e)
    n ** e
  end

  def self.mod(dividend, divider)
    dividend % divider
  end

  def self.is_multiplicative_inverse?(term1, term2)
    # (i * e) % @totiente_n == 1
    mod(term1, term2) == 1
  end

  def self.func_totiente_n(p, q)
    # função totiente em n
    # 𝜑(𝑛) = (𝑝 − 1) ∗ (𝑞 − 1)
    (p - 1) * (q - 1)
  end
end