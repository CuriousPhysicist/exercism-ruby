# Integer Monkey Patch
class Integer
  def to_roman
    raise "The Romans didn't understand #{self}" if self < 1
    numerals = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1].zip(
      %w[M CM D CD C XC L XL X IX V IV I]
    ).to_h
    Converter.new.convert(self, numerals)
  end
end

# Class for converting integers to arbitrary code
class Converter
  def convert(number, encoding_hash, result = '')
    encoding_hash.each do |key, value|
      next if number < key
      number.divmod(key)[0].times { result += value }
      number = number.remainder(key)
    end
    result
  end
end

module BookKeeping
  VERSION = 2
end
