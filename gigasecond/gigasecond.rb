class Gigasecond
  def self.from(date)
    start = date.to_i
    finish = start + 10**9
    Time.at(finish)
  end
end

module BookKeeping
  VERSION = 6
end