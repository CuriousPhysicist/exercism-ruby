# The Primary Class, Bob just knows how to respond.
class Bob
  RESPOND_TO = {
    question: 'Sure.',
    shouting: 'Whoa, chill out!',
    silence:  'Fine. Be that way!',
    general:  'Whatever.'
  }.freeze
  
  @shouting = ->(r) { r.is_a?(Symbol) ? r : (r.upcase == r && r.downcase != r ? :shouting : r) }
  @question = ->(r) { r.is_a?(Symbol) ? r : (r.end_with?('?') ? :question : r) }
  @silence = ->(r) { r.is_a?(Symbol) ? r : (r.empty? ? :silence : r) }
  @general = ->(r ){ r.is_a?(Symbol) ? r : :general }

  def self.hey(remark)
    RESPOND_TO[@general.(@silence.(@question.(@shouting.(remark))))]
  end
end

module BookKeeping
  VERSION = 1
end
