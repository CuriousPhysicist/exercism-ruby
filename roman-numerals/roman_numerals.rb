# Integer Monkey Patch
class Integer
  def to_roman
    raise "The Romans didn't understand #{self}" if self < 1
    key_numbers = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    numerals = %w[M CM D CD C XC L XL X IX V IV I]
    Converter.new(key_numbers, numerals).convert(self)
  end
end

# Class for converting integers to arbitrary code
class Converter
  attr_reader :encoding_hash
  def initialize(keys, values)
    @encoding_hash = keys.zip(values).to_h
  end

  def convert(number, code = '')
    encoding_hash.each do |key, value|
      next if number < key
      number.div(key).times do
        number -= key
        code += value
      end
    end
    code
  end
end

module BookKeeping
  VERSION = 2
end
