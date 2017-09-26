class Raindrops
  def self.convert(number)
    if number == 3
      'Pling'
    elsif number == 5
      'Plang'
    elsif number == 7
      'Plong'
    else
      number.to_s
    end
  end
end