# Required Class
class Phrase
  attr_reader :phrase, :words
  def initialize(phrase)
    @phrase = phrase
    find_words
  end

  def word_count
    count_words.to_h
  end

  private

  def find_words
    @words = phrase.downcase.scan(/\b[\w']+\b/)
  end

  def count_words
    words.map do |word|
      [word, number_of(word)]
    end
  end

  def number_of(word)
    words.count { |wrd| wrd == word }
  end
end

module BookKeeping
  VERSION = 1
end
