# The Primary Class, Bob just knows how to respond.
class Bob
  # Functions to be used by Bob

  shouting = ->(r) { :shouting if r.upcase == r && r.downcase != r }
  question = ->(r) { :question if r.end_with?('?') }
  silence = ->(r) { :silence if r.empty? }
  general = ->(r) { :general }
  check_what_is_happening = ->(r, sh, qu, si, gen) {
   sh(r)
   qu(r)
   si(r)
   gen(r)
 }

 p check_what_is_happening(
      remark,
      shouting(remark),
      question(remark),
      silence(remark),
      general(remark)
      )
    ]
  # RESPOND[to(what_just_happened(shout, question, silence, general, remark))]

  RESPOND= {
      question: 'Sure.',
      shouting: 'Whoa, chill out!',
      silence:  'Fine. Be that way!',
      general:  'Whatever.'
    }.freeze

  def self.hey(remark)
    RESPOND[check_what_is_happening(
      remark,
      shouting(remark),
      question(remark),
      silence(remark),
      general(remark)
      )
    ]
  end
end

module BookKeeping
  VERSION = 1
end
