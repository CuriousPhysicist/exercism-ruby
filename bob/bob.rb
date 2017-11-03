# The Primary Class, Bob just knows how to respond.
class Bob
  RESPOND_TO = {
    question: 'Sure.',
    shouting: 'Whoa, chill out!',
    silence:  'Fine. Be that way!',
    general:  'Whatever.'
  }.freeze

  def self.hey(remark)
    RESPOND_TO[what_is_happening(remark.strip.extend(Conversations))]
  end

  def self.what_is_happening(remark)
    if remark.shouting?
      :shouting
    elsif remark.question?
      :question
    elsif remark.silence?
      :silence
    else
      :general
    end
  end
end

# This module extends the behaviour
# of a conversation string
module Conversations
  def shouting?
    self.upcase == self && self.downcase != self
  end

  def question?
    self.end_with?('?')
  end

  def silence?
    self.empty?
  end
end

module BookKeeping
  VERSION = 1
end
