require 'prime'

class Mathematics
  LIMIT = 100
  @number_primes = Prime.take(LIMIT)

  def self.random_prime
    number_random = rand(LIMIT)
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
end