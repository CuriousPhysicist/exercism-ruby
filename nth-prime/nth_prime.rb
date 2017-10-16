# Required Class
class Prime
  def self.nth(required_prime)
    raise ArgumentError, 'Value must be greater than 0' if required_prime < 1
    @primes = []
    hunt_for_primes(required_prime, 2, 1_000_000)
    @primes[required_prime - 1]
  end

  class << self
    private

    def hunt_for_primes(required_prime, min = 2, max = 1_000_000)
      while @primes.size < required_prime
        @primes += filter(min, max)
        min = max + 1
        max *= 10
      end
    end

    def filter(min, max)
      numbers = [*(min..max)].reject { |candidate| prime_test(candidate) }
      sieve(numbers, max)
    end

    def prime_test(candidate)
      @primes.any? { |prime| (candidate % prime).zero? }
    end

    def sieve(numbers, max)
      numbers.each do |candidate|
        next unless candidate
        break if candidate * candidate > max
        remove_multiples(candidate, max, numbers)
      end
      numbers.compact
    end

    def remove_multiples(candidate, max, numbers)
      (candidate * candidate).step(max, candidate) do |num|
        numbers[num - 2] = nil
      end
    end
  end
end

module BookKeeping
  VERSION = 1
end
