# Required Class
class Squares
  def initialize(number)
    @numbers = (1..number)
    @squares = @numbers.map { |n| n**2 }
    @sum = @numbers.reduce(:+)
  end

  def square_of_sum
    @sum**2
  end

  def sum_of_squares
    @squares.reduce(:+)
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 4
end
