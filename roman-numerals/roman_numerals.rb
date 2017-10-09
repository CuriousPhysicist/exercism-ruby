# Integer Monkey Patch
class Integer
  def to_roman
    key_numbers = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    numerals = %w[M CM D CD C XC L XL X IX V IV I]
    Encoder.new(key_numbers, numerals).encode(self)
  end
end

# Class for encoding integers to arbirary code
class Encoder
  attr_reader :encoding_hash, :pair, :candidate, :cache
  def initialize(keys, values)
    @encoding_hash = keys.zip(values).to_h
    @pair = Struct.new(:number, :code)
    @cache = translation_cache
  end

  def encode(number)
    create_candidate(number)
    encode_number
  end

  private

  def create_candidate(number, code = '')
    @candidate = pair.new(number, code)
  end

  def encode_number
    cache.each do |t|
      next if candidate.number < t.number
      candidate.number.div(t.number).times do
        create_candidate(candidate.number - t.number, candidate.code + t.code)
      end
    end
    candidate.code
  end

  def translation_cache
    encoding_hash.map do |key, value|
      pair.new(key, value)
    end
  end
end

module BookKeeping
  VERSION = 2
end
