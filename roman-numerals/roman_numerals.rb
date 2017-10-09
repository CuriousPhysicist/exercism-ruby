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
  attr_reader :encoding_hash, :pair, :candidate
  def initialize(keys, values)
    @encoding_hash = keys.zip(values).to_h
    @candidate = Struct.new(:number, :code)
  end

  def encode(number)
    encode_number(candidate.new(number, ''))
  end

  private

  def encode_number(candidate)
    encoding_hash.each do |key, value|
      next if candidate.number < key
      candidate.number.div(key).times do
        candidate.number -= key
        candidate.code += value
      end
    end
    candidate.code
  end
end

module BookKeeping
  VERSION = 2
end
