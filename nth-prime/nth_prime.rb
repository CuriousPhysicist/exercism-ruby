# Required Class
class Prime
  def self.nth(required_prime)
    raise ArgumentError, 'Value must be greater than 0' if required_prime < 1
    @primes = []
    min = 2
    max = 1_000_000
    while @primes.size < required_prime
      @primes += sieve(min, max)
      min = max + 1
      max *= 10
    end
    @primes[required_prime - 1]
  end

  def self.sieve(min, max)
    numbers = [*(min..max)]
    numbers.reject! do |n|
      @primes.any? { |prime| (n % prime).zero? }
    end
    numbers.each do |n|
      next unless n
      break if n * n > max
      (n * n).step(max, n) { |num| numbers[num - 2] = nil }
    end
    numbers.compact
  end
end

module BookKeeping
  VERSION = 1
end
