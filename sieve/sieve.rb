# Required Class
class Sieve
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def primes
    numbers_excluding_one.select { |n| prime_test_for(n) }
  end

  private

  def numbers_excluding_one
    (2..number)
  end

  def prime_test_for(n)
    trailing_numbers_for(n).all? { |divider| n % divider != 0 }
  end

  def trailing_numbers_for(n)
    (2...n)
  end
end

module BookKeeping
  VERSION = 1
end
