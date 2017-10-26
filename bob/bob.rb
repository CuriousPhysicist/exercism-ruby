# The Primary Class, Bob just knows how to respond.
class Bob
  RESPONSE = {
    question: 'Sure.',
    shouting: 'Whoa, chill out!',
    silence:  'Fine. Be that way!',
    default:  'Whatever.'
  }.freeze

  def self.hey(remark)
    RESPONSE[Remark.new(remark).type]
  end
end

# This object knows what kind of remark it is
class Remark
  def initialize(remark)
    @remark = remark.strip
  end

  def type
    case
    when shouting?
      :shouting
    when question?
      :question
    when silence? 
      :silence
    else
      :default
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
