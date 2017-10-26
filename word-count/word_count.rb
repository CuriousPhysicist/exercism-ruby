# Required Class
class Phrase
  attr_reader :phrase, :words
  def initialize(phrase)
    @phrase = phrase
    @words = phrase.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    words.group_by { |word| word }.transform_values(&:count)
  end
end

module BookKeeping
  VERSION = 1
end
