# Monkey Patch Enumerable
module Enumerable
  def contains_the_alphabet?
    alphabet = [*'a'..'z']
    (alphabet - self).empty?
  end
end

# Required Class
class Pangram
  def self.pangram?(sentence)
    sentence.downcase.chars.contains_the_alphabet?
  end
end

module BookKeeping
  VERSION = 5
end
