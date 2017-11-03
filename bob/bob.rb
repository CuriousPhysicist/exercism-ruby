# The Primary Class, Bob just knows how to respond.
class Bob
  RESPONSE = {
    question: 'Sure.',
    shouting: 'Whoa, chill out!',
    silence:  'Fine. Be that way!',
    general:  'Whatever.'
  }.freeze

  def self.hey(remark)
    RESPONSE[RealityFilter.new(remark).what_is_happening]
  end
end

# This object knows about the remark
# and simplifies Bob's world
class RealityFilter
  def initialize(remark)
    @remark = remark.strip
  end

  def what_is_happening
    case
    when shouting?
      :shouting
    when question?
      :question
    when silence?
      :silence
    else
      :general
    end
  end

  private

  def shouting?
    @remark.upcase == @remark && @remark.downcase != @remark
  end

  def question?
    @remark.end_with?('?')
  end

  def silence?
    @remark.empty?
  end
end

module BookKeeping
  VERSION = 1
end
