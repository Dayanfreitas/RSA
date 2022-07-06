require 'test/unit'
require_relative '../lib/mathematics'

class MathematicsTest < Test::Unit::TestCase
  def test_is_prime
    number = Mathematics.random_prime
    assert(Prime.prime?(number),'generated prime')
  end

  def test_include_in_prime
    number = Mathematics.random_prime
    assert(Prime.take(Mathematics::LIMIT).include?(number), 'include in prime array')
  end

  def test_pow
    assert_equal(4, Mathematics.pow(2,2), 'two to the power of two equal to four')
  end

  def test_mod
    assert_equal(0, Mathematics.mod(2,2), 'module to the two of two equal zero')
  end

  def test_not_multiplicative_inverse
    assert_false(Mathematics.is_multiplicative_inverse?(2,2), 'multiplicative inverse')
  end

  def test_is_multiplicative_inverse
    assert_true(Mathematics.is_multiplicative_inverse?(235 * 3,352), 'multiplicative inverse')
  end

  def test_func_totiente_n
    assert_equal((9 * 9),  Mathematics.func_totiente_n(10, 10), 'equals')
  end
end