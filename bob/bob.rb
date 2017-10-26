# The Primary Class
class Bob

  RESPONSE = {
    question: 'Sure.',
    shouting: 'Whoa, chill out!',
    silence:  'Fine. Be that way!',
    default:  'Whatever.'
  }

  def self.hey(remark)
    RESPONSE[Remark.new(remark).type]
  end
end

class Remark
  def initialize(remark)
    @remark = remark.strip
  end

  def type
    if @remark.upcase == @remark && @remark.scan(/[a-zA-Z]/).empty? == false
      :shouting
    elsif @remark.chars.last == '?'
      :question
    elsif @remark.empty?
      :silence
    else
      :default
    end
  end
end

module BookKeeping
  VERSION = 1
end
