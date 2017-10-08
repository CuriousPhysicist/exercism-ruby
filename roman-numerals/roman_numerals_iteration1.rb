# Required Class
class Fixnum
  def to_roman
    key_numbers = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    numerals = %w[M CM D CD C XC L XL X IX V IV I]
    roman_numerals = key_numbers.zip(numerals).to_h
    tracker = self
    result = ''
    key_numbers.each do |key|
      tracker.div(key).times do
        result += roman_numerals.fetch(key)
        tracker -= key
      end
    end
    result
  end
end

module BookKeeping
  VERSION = 2
end
