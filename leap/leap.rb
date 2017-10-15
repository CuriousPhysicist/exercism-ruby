# Required Class
class Year
  def self.leap?(year)
    year % 4 == 0 && ( year % 100 != 0 || year % 400 == 0) ? true : false
  end
end

module BookKeeping
  VERSION = 3
end