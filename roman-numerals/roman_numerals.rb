# Required Class
class Integer
  def to_roman
    key_numbers = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    numerals = %w[M CM D CD C XC L XL X IX V IV I]
    convertor(key_numbers, numerals)
  end

  def convertor(key_numbers, numerals)
    tracker = self
    result = ''
    translation(key_numbers, numerals).each do |key, value|
      tracker.div(key).times do
        result += value
        tracker -= key
      end
    end
    result
  end

  def translation(key_numbers, numerals)
    key_numbers.zip(numerals).to_h
  end
end

module BookKeeping
  VERSION = 2
end
