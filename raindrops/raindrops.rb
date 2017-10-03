# Primary Class
class Raindrops
  def self.convert(number)
    find = Translator.new([3, 5, 7], %w[Pling Plang Plong])
    find.result_for(number)
  end
end

# Secondary Class instantiated by Primary Class
class Translator
  def initialize(factors, noises)
    @factors = factors
    @noises = noises
    @noise_for = @factors.zip(@noises).to_h
  end

  def result_for(number)
    find_noises_for(number).empty? ? number.to_s : find_noises_for(number)
  end

  private

  def find_noises_for(number)
    find_factors_for(number).map { |f| @noise_for[f] }.join
  end

  def find_factors_for(number)
    @factors.select { |f| (number % f).zero? }
  end
end

module BookKeeping
  VERSION = 3
end
