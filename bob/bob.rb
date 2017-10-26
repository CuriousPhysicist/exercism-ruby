# The Primary Class
class Bob
  def self.hey(remark)
    if remark.upcase == remark && remark.scan(/[a-zA-Z]/).empty? == false
      'Whoa, chill out!'
    elsif remark.rstrip.chars.last == '?'
      'Sure.'
    elsif remark.strip.empty?
      'Fine. Be that way!'
    else
      'Whatever.'
    end
  end
end

module BookKeeping
  VERSION = 1
end