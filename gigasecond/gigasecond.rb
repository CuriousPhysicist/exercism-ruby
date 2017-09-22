class Gigasecond
  def self.from(date)

  	start = date.to_i
  	finish = start + 10**9
  	Time.at(finish)
  	# puts finish



  end
end