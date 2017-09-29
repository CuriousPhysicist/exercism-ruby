class Raindrops
  def self.convert(number)
    
    result = ""
    
    if number % 3 == 0
      result += "Pling"
    end
    if number % 5 == 0
      result += "Plang"
    end
    if number % 7 == 0
      result += "Plong"
    end

    if result == ""
      number.to_s
    else
      result
    end
  end
end

module BookKeeping
  VERSION = 3
end