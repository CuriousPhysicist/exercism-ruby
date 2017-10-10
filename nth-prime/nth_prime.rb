# Required Class
class Prime
  def self.nth(required_prime)
    raise ArgumentError if required_prime < 1
    primes = sieve(1000000)
    primes[required_prime-1]
  end

  def self.sieve(max)
    numbers = [*(2..max)]
    numbers.each do |n|
      next unless n
      break if n*n > max
      (n*n).step(max, n) { |num| numbers[num-2] = nil }
    end
    numbers.compact
  end
end

module BookKeeping
  VERSION = 1
end
