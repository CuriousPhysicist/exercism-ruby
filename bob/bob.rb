# The Primary Class, Bob just knows how to respond.
class Bob
  RESPOND_TO = {
    question: 'Sure.',
    shouting: 'Whoa, chill out!',
    silence:  'Fine. Be that way!',
    general:  'Whatever.'
  }.freeze

  @shouting = lambda { |r|
    if r.is_a?(Symbol)
      r
    else
      r.upcase == r && r.downcase != r ? :shouting : r
    end
  }
  @question = lambda { |r|
    if r.is_a?(Symbol)
      r
    else
      r.end_with?('?') ? :question : r
    end
  }
  @silence = lambda { |r|
    if r.is_a?(Symbol)
      r
    else
      r.empty? ? :silence : r
    end
  }
  @general = ->(r) { r.is_a?(Symbol) ? r : :general }

  def self.hey(remark)
    RESPOND_TO[
      @general.call(
        @silence.call(
          @question.call(
            @shouting.call(remark.strip)
          )
        )
      )
    ]
  end
end

module BookKeeping
  VERSION = 1
end
